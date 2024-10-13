from taipy.gui import Gui, State, notify
import taipy.gui.builder as tgb

import chromadb
import ollama

def query_llm(prompt):
    client = chromadb.PersistentClient(path="./OLVectorDB")
    collection = client.get_collection(name="docs")
    response = ollama.embeddings(
        prompt=prompt,
        model="mxbai-embed-large"
        )
    results = collection.query(
        query_embeddings=[response["embedding"]],
        n_results=1
    )
    data = results['documents'][0][0]
    output = ollama.generate(
        model="llama3.2",
        prompt=f"Using this data: {data}. Respond to this prompt: {prompt}"
    )
    return output['response']
    # response = ollama.chat(model='llama3.2', messages=[
    # {
    #     'role': 'user',
    #     'content': prompt,
    # },
    # ])
    # return response['message']['content'] # type: ignore

query_message = ""
messages = []
messages_dict = {}

def on_init(state):
    state.messages = [
        {
            "style": "assistant_message",
            "content": "Hi, I am your RAG assistant! How can I help you today?",
        },
    ]
    new_conv = create_conv(state)
    state.conv.update_content(state, new_conv)

def create_conv(state):
    messages_dict = {}
    with tgb.Page() as conversation:
        for i, message in enumerate(state.messages):
            text = message["content"].replace("<br>", "\n").replace('"', "'")
            messages_dict[f"message_{i}"] = text
            tgb.text(
                f"{{messages_dict.get('message_{i}') or ''}}",
                class_name=f"message_base {message['style']}",
                mode="md",
            )
    state.messages_dict = messages_dict
    return conversation

def send_message(state):
    state.messages.append(
        {
            "style": "user_message",
            "content": state.query_message,
        }
    )
    state.conv.update_content(state, create_conv(state))
    notify(state, "info", "Sending message...")
    state.messages.append(
        {
            "style": "assistant_message",
            "content": query_llm(state.query_message),
        }
    )
    state.conv.update_content(state, create_conv(state))
    state.query_message = ""

def style_conv(state: State, idx: int, row: int) -> str:
    """
    Apply a style to the conversation table depending on the message's author.

    Args:
        - state: The current state of the app.
        - idx: The index of the message in the table.
        - row: The row of the message in the table.

    Returns:
        The style to apply to the message.
    """
    if idx is None:
        return None
    elif idx % 2 == 0:
        return "user_message"
    else:
        return "gpt_message"

def reset_chat(state):
    state.query_message = ""
    on_init(state)

#markdown content - page layout
# old GUI
# page = """
# <|{conversation}|table|show_all|row_class_name=style_conv|>
# <|{current_user_message}|input|label=Write your message here...|on_action=send_message|class_name=fullwidth|>
# """

# if __name__ == "__main__":
#     Gui(page, css_file="main.css").run(dark_mode=True, 
#     watermark="youtube.com/@amit.shukla",
#     title="x.com/@ashuklax",host="0.0.0.0", port=8000)

with tgb.Page() as page:
    with tgb.layout(columns="350px 1"):
        with tgb.part(class_name="sidebar"):
            tgb.text("## Taipy RAG", mode="md")
            tgb.button(
                "New Conversation",
                class_name="fullwidth plain",
                on_action=reset_chat,
            )
            tgb.table("{pdf_names}", show_all=True)

        with tgb.part(class_name="p1"):
            tgb.part(partial="{conv}", height="600px", class_name="card card_chat")
            with tgb.part("card mt1"):
                tgb.input(
                    "{query_message}",
                    on_action=send_message,
                    change_delay=-1,
                    label="Write your message:",
                    class_name="fullwidth",
                )

if __name__ == "__main__":
    gui = Gui(page, css_file="main.css")
    conv = gui.add_partial("")
    gui.run(dark_mode=True, margin="0px", watermark="youtube.com/@amit.shukla",
    title="x.com/@ashuklax",host="0.0.0.0", port=8000)
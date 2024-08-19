# GenAI Apps

This blog series is for beginners and young Entrepreneurs who want to build **Gen AI RAG driven applications**.

**Author:** Amit Shukla

**Connect**

[<img src="https://github.com/AmitXShukla/AmitXShukla.github.io/blob/master/assets/icons/youtube.svg" width=40 height=50>](https://youtube.com/@Amit.Shukla)
[<img src="https://github.com/AmitXShukla/AmitXShukla.github.io/blob/master/assets/icons/github.svg" width=40 height=50>](https://github.com/AmitXShukla)
[<img src="https://github.com/AmitXShukla/AmitXShukla.github.io/blob/master/assets/icons/medium.svg" width=40 height=50>](https://medium.com/@Amit-Shukla)
[<img src="https://github.com/AmitXShukla/AmitXShukla.github.io/blob/master/assets/icons/twitter_1.svg" width=40 height=50>](https://x.com/@ashuklax)

click here to access [video playlist](https://youtube.com/@Amit.Shukla)

## What you'll learn
Hands on experience to build Gen AI RAG based Pro Apps, running 100% locally/hosted or API based, using API / tools of your choice.
## Tools
		Vector DB: TryChroma, SQLLite, Supabe or any VectorDB of your choice
		Progamming: Python 3.12+
		Application: Ollama WebUI or Taipy or Flutter
		IDE: Jupyter Lab, Ollama
		LLM: Gemini | llama 3.1 | OpenAI ChatGPT | Anthropic | Local models
## Lessons

| #   | Lesson                                       | Source   | video |
| --- | -------------------------------------------- | -------- | ----- |
| 1   | Learning to setup and use LLM                | [notebook](./Manualify/src/Manualify.ipynb) | link  |
| 2   | working with data loader                     | [notebook](./Manualify/src/Manualify.ipynb) | link  |
| 3   | Tokenizer, Embeddings, Vector DB and LLM     | [notebook](./Manualify/src/Manualify.ipynb) | link  |
| 4   | Tools/Function calling                       | [notebook](./Manualify/src/Manualify.ipynb) | link  |
| 5   | building a functioning web app               | [notebook](./Manualify/src/Manualify.ipynb) | link  |
| 6   | Pro APP : Time Expense monitoring automation | notebook | link  |
| 7   | Pro APP: Local OCR Vision AI                 | notebook | link  |
| 8   | Pro APP: Supply Chain monitoring AI          | notebook | link  |
| 9   | Pro APP: Help Desk automation                | notebook | link  |
| 10  | Pro APP: Auto Responder                      | notebook | link  |
| 11  | Appendix - Other use cases                   | notebook | link  |

**Here is a high level process flow diagram**

```mermaid
---
config:
  sankey:
    showValues: false
---

sankey-beta

%% source,target,value
 Data, Lake, 20
 Data, Cleanse, 40
 Data, Wrangle, 40
 Data, scrape, 40
 Data, Images, 40
 Data, PDFs, 40
 Data, SQL, 40
 Data, Files, 40
 Cleanse, Lake, 40
 Wrangle,Lake, 40
 scrape, Lake,40
 Images,Lake, 40
 PDFs, Lake,40
 SQL, Lake,40
 Files, Lake,40
 Lake, RAG, 30
 Lake, Tokenizer, 10
 RAG, ai.Engine, 40
 Tokenizer, ai.Engine, 30
 VectorDB, ai.Engine, 30
 LLM, ai.Engine, 10
 Embedding, ai.Engine, 10
 Code, ai.Engine, 10
 models, ai.Engine, 10
 prompt templates, ai.Engine, 10
 query translations, ai.Engine, 10
 route, ai.Engine, 10
 SQLs, ai.Engine, 10
 ai.Engine, ai.App, 100
 ai.App, manual, 10
 ai.App, knowledge store, 10
 ai.App, chatbot, 10
 ai.App, ticket handling, 10
 ai.App, assistant, 10
 ai.App, help desk, 10
 ai.App, Account Payables, 10
 ai.App, Supply chain, 10
 ai.App, Finance, 10
 ai.App, Time Expense, 10
 ai.App, HR, 10
 ai.App, CRM, 10
 ai.App, Fraud Alert, 10
 ai.App, Inventory, 10
 ai.App, Auto Replenish, 10
 ai.App, Invoice Match, 10

```
## Sample App images (end results)
![image 1](./Manualify/images/banner_1.png)
![image 2](./Manualify/images/banner_3.png)
![image 3](./Manualify/images/banner_2.png)

## Appendix: other use cases

This blog series covers every step of building, deploying, and launching a basic app from scratch. Later, we'll apply these skills to more complex projects.

- `Manualify.ai` : is a Smart AI for Answering Questions from Tutorials: Harnessing the Power of RAG LLMs and Documents, knowledge store chatbot assistant
- `HelpDesk.ai` : Revolutionizing Customer Support through Automation
- `AutoResponder.ai` : Streamlining Interactions: An Exploration of Automated Chat Moderation and Command Response Systems, automated ticket handling using Service Now

- `Supply chain assistant`:

    - `Auto Invoicing, Duplicate Invoice Match`: 
        - DocumentBot.ai: 
        - Auto reader
        - Payables, Receivables, Voucher, Invoice, Payment, 
        - Receipts, Guided buying, purchase recommendations, anomaly detection
        - bought together, optimum qty, payment monitoring system
        - 3 way match, match exception analysis, AI interceptor invoice monitoring
		- vendor monitoring and analysis
		- ordering supplies - auto replenishment inventory
        - `Spend Classifier`
        - `Smart Supplier:`
        - `Contract Reader, Validator, Recommender Engine`
        - contractual vs non-contractual spending
        - `Sourcing Procurement Contracts Engine`:
        - `SavingsFinder.ai | Guidedbuying.ai`:
        - `Taxonomy`:
        - `ML4GL` - Finance Statement, Security filings RAG
        - `Time & Expense`: audit time, expense and monitoring for employees

- Embeddings :
    
    - `Anomaly Detection` - Identify Fat Finger Purchases, Invoices and transactions
      
    - `Recommendation engine`: create a local version of "purchased together" items recommendation engine based on internal customer purchase history and promotions.
    
    - `Fraud Alerts`:  Identify and Alert Fat Finger Purchases, Invoices and transactions

- **Other Ideas: (Pro Applications)**

    - `RxPathology.ai | Lab.ai`
        
    - `AutoGrader`: School paper grading, self-study assignment grader
    
    - `LawDocs.ai` case applied , case reference , state vs federal law applied to situation

    - `ParliamentReferences.ai`
    - `KitchenKing.ai`
    - `Namastemovie.ai` - movie reviews
    - `Dreamify.ai`
    - `Astrologify.ai`
    - `TradingAlerts.ai | Tradesmart.ai` - using Fundamental and Technical Analysis, generate leads based on in-house RAG Sec Filings database, Trading alerts news etc.
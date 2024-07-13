# GenAI Apps

A curated collection of Production GenAI applications, demonstrating their practical impact in real-world scenarios.

**Author:** Amit Shukla

[License Information](https://github.com/AmitXShukla/GenAI/blob/master/LICENSE)

**Connect**

[<img src="https://github.com/AmitXShukla/AmitXShukla.github.io/blob/master/assets/icons/youtube.svg" width=40 height=50>](https://youtube.com/@Amit.Shukla)
[<img src="https://github.com/AmitXShukla/AmitXShukla.github.io/blob/master/assets/icons/github.svg" width=40 height=50>](https://github.com/AmitXShukla)
[<img src="https://github.com/AmitXShukla/AmitXShukla.github.io/blob/master/assets/icons/medium.svg" width=40 height=50>](https://medium.com/@Amit-Shukla)
[<img src="https://github.com/AmitXShukla/AmitXShukla.github.io/blob/master/assets/icons/twitter_1.svg" width=40 height=50>](https://x.com/@ashuklax)

click here to access [Video Tutorials](https://youtube.com/@Amit.Shukla)

## Introduction

I'm excited to introduce my new blog series on **Gen AI RAG driven applications**. We'll be creating practical tools like AI-powered programming manuals, web scraping software, a real-time knowledge base, virtual assistant, and automatic responder app - all running locally on open-source language models.

In this series, you'll gain hands-on experience in constructing high-caliber applications that function seamlessly within your environment, from local development to production deployment.

In this series, we will use open-source models like **Llama 3, Mistral, Phi, Gemma 2** and Lang Chain, or paid APIs like **Claude, Gemini and Open AI**.
These state-of-the-art systems handle complex tasks across languages and modalities while supporting extensive contexts. 
You can host these models locally or on cloud, depending on your business needs.
In this series, you will find individual scripts which are part of a larger microservices architecture, helping us achieve bigger goals by taking small steps forward. We'll use local LLMs and code models, as well as **OLLAMA**, **Lang Chain**, **TAIPY**, **Chroma**, and other technologies that can operate offline without internet connectivity, ensuring your data remains safe and secure within your premises.

Additionally, you will learn to:

1. **Utilize proprietary data** effectively within these applications to ensure confidentiality and tailor solutions specifically to your organization's needs.

2. **Run & Manage models locally** for faster processing times, reducing dependency on cloud services, and enhancing control over the application infrastructure.

3. **Handle multi-modal inputs/outputs**—incorporating textual, visual, and auditory data to create applications capable of more natural human-computer interactions.

4. **Support multiple languages** in your apps, ensuring a broader reach and inclusivity for users worldwide.

5. **Process larger contexts** without performance bottlenecks, allowing the application to maintain high responsiveness even when dealing with extensive amounts of information or complex queries.

We will not cover all of these scenarios and may not in depth as much we wanted to in a real production system, however, we will simulate as much as we can, to perform a quick POC.

**Here is a high level process flow diagram**

```mermaid
%%{init:{'theme':'light'}}%%
%%{init:{'themeCSS':'.messageLine0:nth-of-type(2) { stroke: red; };.messageText:nth-of-type(1) { fill: green; font-size: 20px !important;}; g:nth-of-type(3) rect.actor { stroke:blue;fill: pink; }; g:nth-of-type(5) .note { stroke:blue;fill: crimson; };#arrowhead path {stroke: blue; fill:red;};'}}%%

sequenceDiagram
	Data->>ELTLake: ELT Pipeline
	Data->>ELTLake: Cleanse, Wrangle, web scrape
	Data->>ELTLake: Images, PDFs, SQL RDBMS Lake
	ELTLake->>AI.Engine: RAG, Tokenizer
	AI.Engine-->>ELTLake: VectorDB
	AI.Engine-->>GenAI.App: Ai.Apps
	GenAI.App-)AI.Engine: LLM, embedding, code models
	GenAI.App-)AI.Engine: prompt templates, routing, SQL, RAG
	AI.Engine-->>GenAI.App:manual, knowledge store, chatbot
	AI.Engine-->>GenAI.App:help desk assistant, ticket handling
	AI.Engine-->>GenAI.App:Account Payables
	AI.Engine-->>GenAI.App:Supply chain 
```

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
 Lake, RAG, 10
 Lake, Tokenizer, 10
 RAG, ai.Engine, 10
 Tokenizer, ai.Engine, 10
 VectorDB, ai.Engine, 10
 LLM, ai.Engine, 10
 Embedding, ai.Engine, 10
 Code, ai.Engine, 10
 models, ai.Engine, 10
 prompt templates, ai.Engine, 10
 query translations, ai.Engine, 10
 route, ai.Engine, 10
 SQLs, ai.Engine, 10
 ai.Engine, ai.app, 100
 ai.app, manual, 10
 ai.app, knowledge store, 10
 ai.app, chatbot, 10
 ai.app, ticket handling, 10
 ai.app, assistant, 10
 ai.app, help desk, 10
 ai.app, Account Payables, 10
 ai.app, Supply chain, 10
 ai.app, Finance, 10
 ai.app, Time Expense, 10
 ai.app, HR, 10
 ai.app, CRM, 10
 ai.app, Fraud Alert, 10
 ai.app, Inventory, 10
 ai.app, Auto Replenish, 10
 ai.app, Invoice Match, 10

```
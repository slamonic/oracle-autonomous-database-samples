# About Select AI

**Select AI** lets you use natural language to interact with your database and large language models (LLMs) directly through SQL. It’s designed to enhance user productivity and simplify the development of AI-based applications. With Select AI, you can generate, run, and explain SQL from natural language prompts, perform retrieval-augmented generation (RAG) using vector stores, generate synthetic data, or even chat with an LLM - all from a familiar SQL interface.

When you use Select AI, **Oracle Autonomous AI Database** manages the process of converting natural language into SQL. This means you can provide natural language prompts instead of writing SQL code to explore and query your data. Select AI serves as a productivity tool for experienced SQL developers and empowers non-expert users to extract insights without needing to understand database schemas or query syntax.

Select AI also automates the **retrieval-augmented generation (RAG)** workflow: generating vector embeddings, performing semantic similarity searches, and retrieving relevant content from your vector store. Additional capabilities include **synthetic data generation**, **chat history support**, and other advanced AI functions - all accessible through SQL.

The [DBMS_CLOUD_AI](https://docs.oracle.com/en/cloud/paas/autonomous-database/serverless/adbsb/dbms-cloud-ai-package.html#GUID-000CBBD4-202B-4E9B-9FC2-B9F2FF20F246) PL/SQL package provides programmatic integration with user-specified LLMs. It automatically augments prompts with schema metadata, enabling natural language-to-SQL translation, RAG with vector stores, synthetic data generation, and conversational LLM sessions. The package supports multiple AI providers and LLMs listed under [Select Your AI Provider and LLMs](https://docs.oracle.com/en/cloud/paas/autonomous-database/serverless/adbsb/select-ai-about.html#GUID-FDAEF22A-5DDF-4BAE-A465-C1D568C75812) in the Oracle documentation.

---

## Folder Structure

- **sql/**
- **python/**
- **r/**
- **notebooks/**

---

## Related Repository

**Ask Oracle** allows you to query data in Autonomous Database using natural language.  
It uses the AI profiles stored in the current user's schema, supporting both natural language to SQL and retrieval-augmented generation (RAG).  
[oracle-devrel/oracle-autonomous-database-samples/tree/main/apex/Ask-Oracle](https://github.com/oracle-devrel/oracle-autonomous-database-samples/tree/main/apex/Ask-Oracle)

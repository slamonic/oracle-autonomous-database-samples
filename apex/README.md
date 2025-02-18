# Sample APEX Apps
Listed below are sample applications that leverage Autonomous Database.

Autonomous Database is already configured with APEX ([see documentation](https://docs.oracle.com/en/cloud/paas/autonomous-database/serverless/adbsb/application-express-autonomous-database.html)). You can simply import the applications using the APEX App Builder.

## ADB Chat
ADB Chat allows you to query data in Autonomous Database using natural language. It uses the AI profiles that are in the current user's schema. Those profiles support both natural language to SQL as well as RAG.

<iframe width="560" height="315" src="https://www.youtube.com/embed/2C-wirdC0aw?si=yVmGrZj2rNvJ36Nf" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

Simply import the application into your APEX development environment.

* [Download application](select-ai-chat/f101.sql)

Background material:
* [Create an AI profile](../sql/select-ai-create-profile.sql)
* [NL2SQL](../sql/select-ai-nl2sql.sql)
* [Select AI RAG](../sql/select-ai-rag.sql)



<hr>
Copyright (c) 2025 Oracle and/or its affiliates.<br>
Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl/

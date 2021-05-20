An overall project was to build a data warehouse. 

To accomplish this task, I, along with other groups, simulated sales data for a grocery store that has 2075 unique items belonging to approximately 200 categories, ie. milk and baby food. 
From this simulation of datapoints, we built our transational databases that held data on each transaction, such as customer info, sku purchased, item price, sale price. 
I decided which fields were required to answer buisness questions and to be able to uniquely identify each transaction. 

Questions could include things like which items were purchased frequently together, what is total profit during some time (quarter, fiscal year), and which days yielded the highest sales data. 

I then conformed all the data to be compatible with other groups (date formats, data types and data specifics (transactional vs. daily sales)) and rolled up groups of data into a data mart that would help us answer these questions. 

Along with the data fact tables in the data warehouse, we designed dimension tables to house the product info, date info, customer info, etc. 

From there we could do data aggregation to answer the majority of the business questions. Also, utilizing market basket analysis, we could quantify which items were purchased together frequently and out finds showed things like peanut butter and jelly were frequently paired. Similarly things like baby food and diapers were purchased together often. 

CREATE TABLE "daily_inventory_fact" (
	"ProductKey"	INTEGER ,
	"DateKey"	INTEGER,
	"StoreKey"	INTEGER,
	"NumberAvailable"	INTEGER,
	"CostToStore_Item"	Float,
	"CostToStore_Case"	Float,
	"NumberCasesPurchasedToDate"	INTEGER,
	PRIMARY KEY("ProductKey","DateKey","StoreKey")
);
attach database '/region_a.db' as region_a;


Create temp view Transaction_view as 
SELECT store, date, sku, sale_price, min(items_left) as Number_available,max(total_cases_ordered) as totalcasesordered
    FROM region_a.transactions
    GROUP BY store, date, sku, sale_price ;

INSERT into daily_inventory_fact(DateKey,ProductKey,StoreKey,NumberAvailable,CostToStore_item,CostToStore_Case,NumberCasesPurchasedToDate)	
SELECT d.DateKey,p.ProductKey,T.store ,T.Number_available,Round(((T.sale_price)/1.1),3) AS BasePrice,Round(((12*T.sale_price)/1.1),3),T.totalcasesordered from date_dimension d join Transaction_view T ON T.date = d.date join product_dimension p ON T.sku=p.sku 

 
 
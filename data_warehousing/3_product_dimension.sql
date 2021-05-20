create table product_dimension(
Product_key integer PRIMARY key AUTOINCREMENT,
 SKU shorttext,
product_name shorttext,
product_classid integer,
 subcategory shorttext,
category shorttext,
 department shorttext,
Product_family shorttext,
 size shorttext,
 Numberpercase integer DEFAULT 12,
 Manufacturer shorttext,
 Supplier shorttext);

INSERT into product_dimension(SKU,Manufacturer,product_name,size,product_classid,category,department,Product_family,subcategory)
 SELECT p.sku,
 p.Manufacturer,
 p.ProductName
 ,p.Size,
 pd.product_class_id,
 pd.product_category,
 pd.product_department,
 pd.product_family,
 pd.product_subcategory 
 from products p left join product_class pd ON  pd.product_subcategory=p.itemType;


 UPDATE product_dimension
 set Supplier='Rowan Dairy' where Manufacturer='Rowan Dairy';
 
 UPDATE product_dimension
 set Supplier='Rowan Warehouse' where Manufacturer NOT LIKE 'Rowan Dairy';
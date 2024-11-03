/* SQL for STA */

USE [S24_EXAM_STA]
CREATE TABLE [Orders] (
    [order_id] varchar(255),
    [customer_id] varchar(255),
    [order_status] varchar(255),
    [order_purchase_timestamp] varchar(255),
    [order_approved_at] varchar(255),
	[order_delivered_carrier_date] varchar(255),
    [order_delivered_customer_date] varchar(255),
	[order_estimated_delivery_date] varchar(255)
)
GO

USE [S24_EXAM_STA]
CREATE TABLE [OrderItems] (
    [order_id] varchar(255),
    [order_item_id] varchar(255),
	[product_id] varchar(255),
	[seller_id] varchar(255),
	[shipping_limit_date] varchar(255),
	[price] varchar(255),
	[freight_value] varchar(255)
)
GO

USE [S24_EXAM_STA]
CREATE TABLE [OrderPayments] (
    [order_id] varchar(255),
	[payment_sequential] varchar(255),
    [payment_type] varchar(255),
	[payment_installments] varchar(255),
	[payment_value] varchar(255)
)
GO

USE [S24_EXAM_STA];
CREATE TABLE [OrderReviews] (
    [review_id] nvarchar(255),
    [order_id] nvarchar(255),
    [review_score] nvarchar(255),
    [review_comment_title] nvarchar(255),
    [review_comment_message] nvarchar(255),
    [review_creation_date] nvarchar(255),
    [review_answer_timestamp] nvarchar(255)
);
GO


USE [S24_EXAM_STA]
CREATE TABLE [Customers] (
	[customer_id] varchar(255),
	[customer_unique_id] varchar(255),
	[customer_zip_code_prefix] varchar(255),
	[customer_city] varchar(255),
	[customer_state] varchar(255)
)
GO

USE [S24_EXAM_STA]
CREATE TABLE [Sellers] (
    [seller_id] varchar(255),
    [seller_zip_code_prefix] varchar(255),
    [seller_city] varchar(255),
    [seller_state] varchar(255)
)
GO

USE [S24_EXAM_STA]
CREATE TABLE [Products] (
    [product_id] varchar(255),
    [product_category_name] varchar(255),
    [product_name_length] varchar(255),
    [product_description_length] varchar(255),
    [product_photos_qty] varchar(255),
    [product_weight_g] varchar(255),
    [product_length_cm] varchar(255),
    [product_height_cm] varchar(255),
    [product_width_cm] varchar(255)
)
GO

USE [S24_EXAM_STA]
CREATE TABLE [ProductCategory] (
    [product_category_name] varchar(255),
    [product_category_name_english] varchar(255)
)
GO

USE [S24_EXAM_STA]
CREATE TABLE [Geolocation] (
    [geolocation_zip_code_prefix] nvarchar(255),
    [geolocation_lat] nvarchar(255),
    [geolocation_lng] nvarchar(255),
    [geolocation_city] nvarchar(255),
    [geolocation_state] nvarchar(255)
)
GO





/* VARIOUS SQL I USE during STA PHASE */

USE [S24_EXAM_ADM]
ALTER TABLE [Rejects]
ALTER COLUMN [RejectPackageAndTask] nvarchar(255)
GO
USE [S24_EXAM_ADM]
ALTER TABLE [Rejects]
ALTER COLUMN [RejectColumn] nvarchar(255)
GO
USE [S24_EXAM_ADM]
ALTER TABLE [Rejects]
ALTER COLUMN [RejectDescription] nvarchar(max)
GO


USE [S24_EXAM_STA]
GO
SELECT DATABASEPROPERTYEX('S24_EXAM_STA', 'Collation') AS DatabaseCollation;

USE [S24_EXAM_STA];
GO
ALTER TABLE dbo.OrderReviews
ALTER COLUMN [review_comment_message] nvarchar(255);
GO
ALTER TABLE dbo.OrderReviews
ALTER COLUMN [review_id] varchar(255);
GO
ALTER TABLE dbo.OrderReviews
ALTER COLUMN [order_id] varchar(255);
GO
ALTER TABLE dbo.OrderReviews
ALTER COLUMN [review_score] varchar(255);
GO
ALTER TABLE dbo.OrderReviews
ALTER COLUMN [review_comment_title] varchar(255);
GO
ALTER TABLE dbo.OrderReviews
ALTER COLUMN [review_creation_date] varchar(255);
GO
ALTER TABLE dbo.OrderReviews
ALTER COLUMN [review_answer_timestamp] varchar(255);
GO




/* SQL for ODS */



USE [S24_EXAM_ODS]
CREATE TABLE [Orders] (
    [order_id] varchar(50),
    [customer_id] varchar(50),
    [order_status] varchar(20),
    [order_purchase_timestamp] datetime,
    [order_approved_at] datetime,
    [order_delivered_customer_date] datetime
)
GO

USE [S24_EXAM_ODS];
CREATE TABLE [OrderItems] (
    [order_id] varchar(50),
    [order_item_id] varchar(50),
    [product_id] varchar(50),
    [seller_id] varchar(50),
    [price] numeric(18,2),
    [freight_value] numeric(18,2)
)
GO



USE [S24_EXAM_ODS]
CREATE TABLE [OrderPayments] (
    [order_id] varchar(50),
    [payment_type] varchar(30),
    [payment_value] numeric(18,2)
)
GO


USE [S24_EXAM_ODS];
CREATE TABLE [OrderReviews] (
    [review_id] varchar(50),
    [order_id] varchar(50),
    [review_comment_title] nvarchar(100),
    [review_comment_message] nvarchar(255),
    [review_score] bigint,
    [review_creation_date] datetime
)
GO


USE [S24_EXAM_ODS];
CREATE TABLE [Customers] (
    [customer_id] varchar(50),
    [customer_unique_id] varchar(50),
    [customer_zip_code_prefix] bigint
)
GO

USE [S24_EXAM_ODS];
CREATE TABLE [Sellers] (
    [seller_id] varchar(50),
    [seller_zip_code_prefix] bigint

)

USE [S24_EXAM_ODS];
CREATE TABLE [Geolocation] (
    [geolocation_zip_code_prefix] bigint,
    [geolocation_lng] decimal(28,20),
    [geolocation_lat] decimal(28,20),
    [geolocation_city] nvarchar(50),
    [geolocation_state] varchar(50)
)
GO

USE [S24_EXAM_ODS];
CREATE TABLE [Products] (
    [product_id] varchar(50),
    [product_category_name] varchar(50),
    [product_photos_qty] int,
    [product_weight_g] numeric(18,1),
    [product_length_cm] numeric(18,1),
    [product_height_cm] numeric(18,1),
    [product_width_cm] numeric(18,1)
)
GO

USE [S24_EXAM_ODS];
CREATE TABLE [ProductCategory] (
    [product_category_name] varchar(50),
    [product_category_name_english] varchar(50)
)
GO


/*** DWH MODELING ***/
/* SQL FOR DWH */

USE [S24_EXAM_DWH]
CREATE TABLE [DimGeolocation] (
	[geolocation_key] INT PRIMARY KEY IDENTITY(1,1),
	[geolocation_lng] numeric(28,8),
    [geolocation_lat] numeric(28,8),
    [geolocation_zip_code_prefix] bigint,
    [geolocation_city] nvarchar(50),
    [geolocation_state] varchar(50)
)
GO

USE [S24_EXAM_DWH]
CREATE TABLE [DimCustomers] (
	[customer_key] INT PRIMARY KEY IDENTITY(1,1),
    [customer_id] varchar(50),
    [customer_unique_id] varchar(50),
    [geolocation_key] int
)
GO

USE [S24_EXAM_DWH]
CREATE TABLE [DimSellers] (
	[seller_key] INT PRIMARY KEY IDENTITY(1,1),
    [seller_id] varchar(50),
    [geolocation_key] int
)
/*
USE [S24_EXAM_DWH]
CREATE TABLE [DimProducts] (
	[product_key] INT PRIMARY KEY IDENTITY(1,1),
    [product_id] varchar(50),
	[product_category_name] varchar(50),
    [product_category_name_english] varchar(50),
    [product_photos_qty] int,
    [product_weight_g] numeric(18,1),
    [product_length_cm] numeric(18,1),
    [product_height_cm] numeric(18,1),
    [product_width_cm] numeric(18,1),
    [seller_key] int,
    [price] numeric(18,2),
    [freight_value] numeric(18,2)
)
GO */
/* a slight change to the dimproducts table, to not include seller key*/
USE [S24_EXAM_DWH]
CREATE TABLE [DimProducts] (
	[product_key] INT PRIMARY KEY IDENTITY(1,1),
    [product_id] varchar(50),
	[product_category_name] varchar(50),
    [product_category_name_english] varchar(50),
    [product_photos_qty] int,
    [product_weight_g] numeric(18,1),
    [product_length_cm] numeric(18,1),
    [product_height_cm] numeric(18,1),
    [product_width_cm] numeric(18,1),
    [price] numeric(18,2),
    [freight_value] numeric(18,2)
)
GO


USE [S24_EXAM_DWH]
CREATE TABLE [DimReviews] (
	[review_key] INT PRIMARY KEY IDENTITY(1,1),
	[DateKey] int,
    [review_id] varchar(50),
    [order_id] varchar(50),
    [review_comment_title] nvarchar(100),
    [review_comment_message] nvarchar(255),
    [review_score] bigint
)

/*
USE [S24_EXAM_DWH]
CREATE TABLE [DimOrderItems] (
	[order_key] INT PRIMARY KEY IDENTITY(1,1),
    [order_identifier] nvarchar(101),
    [product_key] int,
    [seller_key] int
)
GO */



/********** FACT TABLE ************/

USE [S24_EXAM_DWH]
CREATE TABLE [FactOrders] (
    [order_identifier] nvarchar(255) PRIMARY KEY,
    [customer_key] int,
    [order_status] varchar(20),
	[order_purchase_date] date,
    [order_approved_at] date,
    [order_delivered_customer_date] date,
    [payment_type] varchar(50),
    [payment_value] numeric(18,2),
)
GO
/*
USE [S24_EXAM_DWH]
CREATE TABLE [FactOrders] (
    [order_identifier] nvarchar(255),
    [customer_key] int,
    [seller_key] int,
    [product_key] int,
    [order_status] varchar(20),
    [order_purchase_date] datetime,
    [order_approved_at] datetime,
    [order_delivered_customer_date] datetime,
    [payment_type] varchar(50),
    [payment_value] numeric(18,2),
	[number_of_items] int
)
GO */

USE [S24_EXAM_DWH]
CREATE TABLE [FactOrders] (
    [order_id] varchar(50),
	[order_item_id] int,
    [customer_key] int,
    [seller_key] int,
    [product_key] int,
	[review_key] int,
    [order_status] varchar(20),
    [order_purchase_date] int,
    [order_approved_at] int,
    [order_delivered_customer_date] int,
    [payment_type] varchar(50),
    [total_invoiced] numeric(18,2)
)
GO







 /* ADM */
USE [S24_EXAM_ADM]
CREATE TABLE [FunctionalReject] (
    [Rejects_Date] datetime,
    [RejectPackageAndTask] nvarchar(201),
    [RejectColumn] nvarchar(50),
    [RejectDescription] nvarchar(101)
)
GO


USE [S24_EXAM_ADM]
CREATE TABLE [Rejects] (
    [Rejects_Date] datetime,
    [RejectPackageAndTask] nvarchar(201),
    [RejectColumn] nvarchar(50),
    [RejectDescription] nvarchar(101)
)
GO
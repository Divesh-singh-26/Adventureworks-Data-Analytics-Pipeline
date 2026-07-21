CREATE DATABASE IF NOT EXISTS adventureworks;
use adventureworks;

create table customers (
    customer_key int primary key,
    prefix varchar(10),
    first_name varchar(50),
    last_name varchar(50),
    birth_date date,
    marital_status char(10),
    gender char(10),
    email_address varchar(100),
    annual_income decimal(12,2),
    total_children tinyINT,
    education_level varchar(50),
    occupation varchar(50),
    home_owner varchar(5),
    age tinyint
);

create table products (
    product_key int primary key,
    product_subcategory_key int,
    product_sku varchar(50),
    product_name varchar(50),
    model_name varchar(50),
    product_description	varchar(500),
    product_color char(20),
    product_size char(5),
    product_style char(5),
    product_cost decimal(12,2),
    product_price decimal(12,2)
);
create table categories (
    product_category_key int primary key,
    category_name varchar(50)
);

create table subcategories (
    product_subcategory_key int primary key,
    subcategory_name varchar(50),
    product_category_key int
);

create table territories (
	sales_territory_key int primary key,
    region varchar(50),
    country varchar(50),
    continent varchar(50)
);
create table calendar (
    date date primary key,
    year int,
    quarter varchar(10),
    month varchar(10),
    month_num int,
    day int,
    day_name varchar(10),
    week int,
    day_of_year int,
    is_weekend bool
);
create table sales (
    order_date date,
    stock_date date,
    order_number varchar(50),
    product_key int,
    customer_key int,
    territory_key int,
    order_line_item int,
    order_quantity int,
    product_price decimal(12,2),
    product_cost decimal(12,2),
    revenue decimal(12,2),
    profit decimal(12,2),
    profit_margin decimal(12,2),
    
    primary key(order_number , product_key, order_line_item)
);

create table returns (
	return_date date,
    territory_key int,
    product_key int,
    return_quantity int
);

alter table sales
add constraint fk_sales_customer
foreign key (customer_key)
references customers(customer_key);

alter table sales
add constraint fk_sales_product
foreign key (product_key)
references products(product_key);

alter table sales
add constraint fk_sales_territory
foreign key (territory_key)
references territories(sales_territory_key);

alter table sales
add constraint fk_sales_calendar
foreign key (order_date)
references calendar(date);

alter table products
add constraint fk_product_subcategory
foreign key (product_subcategory_key)
references subcategories(product_subcategory_key);

alter table subcategories
add constraint fk_subcategory_category
foreign key (product_category_key)
references categories(product_category_key);

alter table returns
add constraint fk_returns_product
foreign key (product_key)
references products(product_key);

alter table returns
add constraint fk_return_territory
foreign key (territory_key)
references territories(sales_territory_key);

alter table returns
add constraint fk_returns_calendar
foreign key (return_date)
references calendar(date);

select * from customers;
select * from products;
select * from calendar;
select * from categories;
select * from returns;
select * from sales;
select * from subcategories;
select * from territories;
create database task6;
show databases;
use task6;
create table sales_data(invoiceNo int,stockCode varchar(20),description text,quantity int,invoiceDate datetime,unitPrice decimal(10,2),customerID int, country varchar(50));
load data infile "C:/Users/Admin/Downloads/data.csv" into table sales_data fields terminated by ','enclosed by '"'lines terminated by '\n'ignore 1 rows;
alter table sales_data modify invoiceNo varchar(20);
alter table sales_data modify customerID  varchar(100) null;
select * from sales_data;
# Extract month from sale_data table
select extract(month from invoiceDate) as invoice_month from sales_data;
#GroupBY Year AND Month
select year(invoiceDate)as Year, month(invoiceDate)as Month,count(*)as total_sales from sales_data group by year, month order by year,month;

#Ue SUM() for revenue
select year(invoiceDate)as year,month(invoiceDate)as month,sum(quantity * unitPrice)as total_revenue from sales_data group by year,month order by year,month;

#Count of order id

select  count(distinct customerID) from sales_data;
select count(customerID)from sales_data;

# Order By Sorting
select year(invoiceDate) as year,month(invoiceDate)as month,count(distinct customerID)as unique_customers,sum(quantity * unitPrice)as total_revenue from sales_data group by year,month order by year,month;

# Limit Result for specific time period

select year(invoiceDate)as year,month(invoiceDate)as month,count(distinct customerID)as unique_customers,sum(quantity * unitPrice )as total_revenue from sales_data where year(invoiceDate)=2010 group by year, month order by year,month;
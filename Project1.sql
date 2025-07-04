/*View entire data*/
select * from Sales

/*Distinct Product categories, Region*/
Select distinct productcategory from Sales
Select distinct Region from Sales


/*Sales data by Product - average sales amount, average profit, total sales and total profit*/
select Productcategory,avg(sales) As [Average Sales],avg(profit) As [Average Profit],
sum(sales) [Total Sales],sum(profit) As [Total Profit]
from Sales group by ProductCategory

/*Sales data by Region - average sales amount, average profit, total sales and total profit*/
select Region,avg(sales) As [Average Sales],avg(profit) As [Average Profit],
sum(sales) [Total Sales],sum(profit) As [Total Profit]
from Sales group by Region 

/* Maximum profit and highest sales */
select max(profit) [Max profit] from Sales 

/*Converting OrderDate to Date format*/
select * from Sales
select orderid, cast(substring(Orderdate,1,2) as int) as OD,
cast(substring(Orderdate,4,2) as int) as OM,
cast(substring(Orderdate,7,4) as int) as OY,
convert(date,(substring(Orderdate,1,2) + '/' + substring(Orderdate,4,2) + '/' + substring(Orderdate,7,4)),105) As OrderDate
into #tempdate
from Sales

/*Creating a new table with converted date after joining with temporary table*/
Select  S.OrderID,S.ProductCategory,S.Region,S.Sales As Amount, S.Quantity,S.Profit, T.OrderDate
into SalesData
From Sales S
inner join #tempdate T
on S.OrderID = T.OrderID

Select * from SalesData

/* Optimizing queries*/
/*Maximum quantities each Year per product*/
Select productcategory, max(quantity) Quantity, year(Orderdate) Year
from SalesData
group by productcategory, year(Orderdate) 
order by max(quantity) desc

/* Profit per year*/
Select sum(profit) Profit, year(Orderdate) [Year]
from SalesData
group by year(Orderdate)

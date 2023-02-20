# LAB 4
-- Create DB
create database if not exists ecom;
use ecom;

-- Create Required Tables
create table if not exists supplier(
supp_id int primary key,
supp_name varchar(50) not null,
supp_city varchar(50) not null,
supp_phone varchar(50) not null);

create table if not exists customer(
cus_id int primary key,
cus_name varchar(20) not null,
cus_phone varchar(10) not null,
cus_city varchar(30) not null,
cus_gender char);

create table if not exists category(
cat_id int primary key,
cat_name varchar(20) not null);

create table if not exists product (
pro_id int primary key,
pro_name VARCHAR(20) not null default 'Dummy',
pro_desc VARCHAR(60) not null,
cat_id int not null,
foreign key(cat_id) REFERENCES category (cat_id));

create table if not exists supplier_pricing(
pricing_id int primary key,
pro_id int,
supp_id int,
supp_price int default 0,
foreign key(pro_id) references product (pro_id),
foreign key(supp_id) references supplier(supp_id));

create table if not exists orders (
ord_id int primary key,
ord_amount int not null,
ord_date date not null,
cus_id int,
pricing_id int,
foreign key (cus_id) references customer(cus_id),
foreign key(pricing_id) references supplier_pricing(pricing_id));

drop table rating;
create table if not exists rating(
rat_id int primary key,
ord_id int,
rat_ratstars int not null,
foreign key(ord_id) references orders(ord_id));

-- insert data

-- inserting data into suppliers
insert into supplier values(1,"Rajesh Retails","Delhi",'1234567890');
insert into supplier values(2,"Appario Ltd.","Mumbai",'2589631470');
insert into supplier values(3,"Knome Products","Banglore",'9785462315');
insert into supplier values(4,"Bansal Retails","Kochi",'8975463285');
insert into supplier values(5,"Mittal Ltd.","Lucknow",'7898456532');

-- -- inserting data into customers
insert into customer values(1,"AAKASH",'9999999999',"DELHI",'M');
insert into customer values(2,"AMAN",'9785463215',"NOIDA",'M');
insert into customer values(3,"NEHA",'9999999999',"MUMBAI",'F');
insert into customer values(4,"MEGHA",'9994562399',"KOLKATA",'F');
insert into customer values(5,"PULKIT",'7895999999',"LUCKNOW",'M');

-- -- inserting data into category
insert into category values( 1,"BOOKS");
insert into category values(2,"GAMES");
insert into category values(3,"GROCERIES");
insert into category values (4,"ELECTRONICS");
insert into category values(5,"CLOTHES");

-- -- inserting data into product
insert into product values(1,"GTA V","Windows 7 and above with i5 processor and 8GB RAM",2);
insert into product values(2,"TSHIRT","SIZE-L with black, blue and white variations",5);
insert into product values(3,"ROG LAPTOP","Windows 10 with 15inch screen, i7 processor, 1TB SSD",4);
insert into product values(4,"OATS","highly nutritious from nestle",3);
insert into product values(5,"HARRY POTTER","best collection of all time by J.K rowling",1);
insert into product values(6,"MILK","1L toned milk",3);
insert into product values(7,"Boat Earphones","1.5meter long dolby atmos",4);
insert into product values(8,"Jeans","Stretchable denim jeans with various sizes and color",5);
insert into product values(9,"Project IGI","compatible with windows 7 and above",2);
insert into product values(10,"Hoodie","Black GUCCI for 13 yrs and above",5);
insert into product values(11,"Rich Dad Poor Dad","Written by Robert Kiyosaki",1);
insert into product values(12,"Train Your Brain","By Shireen Stephen",1);


-- -- inserting data into supplier_pricing
insert into supplier_pricing values(1,1,2,1500);
insert into supplier_pricing values(2,3,5,30000);
insert into supplier_pricing values(3,5,1,3000);
insert into supplier_pricing values(4,2,3,2500);
insert into supplier_pricing values(5,4,1,1000);
insert into supplier_pricing values(6,12,2,780);
insert into supplier_pricing values(7,12,4,789);
insert into supplier_pricing values(8,3,1,31000);
insert into supplier_pricing values(9,1,5,1450);
insert into supplier_pricing values(10,4,2,999);
insert into supplier_pricing values(11,7,3,549);
insert into supplier_pricing values(12,7,4,529);
insert into supplier_pricing values(13,6,2,105);
insert into supplier_pricing values(14,6,1,99);
insert into supplier_pricing values(15,2,5,2999);
insert into supplier_pricing values(16,5,2,2999);


-- -- inserting data into orders
insert into `orders` values (101,1500,"2021-10-06",2,1);
insert into `orders` values(102,1000,"2021-10-12",3,5);
insert into `orders` values(103,30000,"2021-09-16",5,2);
insert into `orders` values(104,1500,"2021-10-05",1,1);
insert into `orders` values(105,3000,"2021-08-16",4,3);
insert into `orders` values(106,1450,"2021-08-18",1,9);
insert into `orders` values(107,789,"2021-09-01",3,7);
insert into `orders` values(108,780,"2021-09-07",5,6);
insert into `orders` values(109,3000,"2021-09-10",5,3);
insert into `orders` values(110,2500,"2021-09-10",2,4);
insert into `orders` values(111,1000,"2021-09-15",4,5);
insert into `orders` values(112,789,"2021-09-16",4,7);
insert into `orders` values(113,31000,"2021-09-16",1,8);
insert into `orders` values(114,1000,"2021-09-16",3,5);
insert into `orders` values(115,3000,"2021-09-16",5,3);
insert into `orders` values(116,99,"2021-09-17",2,14);

-- -- inserting data into rating
insert into rating values(1,101,4);
insert into rating values(2,102,3);
insert into rating values(3,103,1);
insert into rating values(4,104,2);
insert into rating values(5,105,4);
insert into rating values(6,106,3);
insert into rating values(7,107,4);
insert into rating values(8,108,4);
insert into rating values(9,109,3);
insert into rating values(10,110,5);
insert into rating values(11,111,3);
insert into rating values(12,112,4);
insert into rating values(13,113,2);
insert into rating values(14,114,1);
insert into rating values(15,115,1);
insert into rating values(16,116,0);

-- 3 Display the total number of customers based on gender who have placed orders of worth at least Rs.3000.
select count(customer.cus_gender) from customer join orders on customer.cus_id = orders.cus_id and ord_amount >= 3000 group by customer.cus_gender;

-- 4 Display all the orders along with product name ordered by a customer having Customer_Id=2
select pro.pro_name,o.ord_amount,o.ord_date
from orders o
join supplier_pricing sp
on o.pricing_id = sp.pricing_id
join product pro
on sp.pro_id = pro.pro_id
where o.cus_id = 2;

-- 5 Display the Supplier details who can supply more than one product.
select * from supplier where supp_id in (select supp_id from supplier_pricing group by (supp_id) having count(supp_id)>1);

-- 6 Find the least expensive product from each category and print the table with category id, name, product name and price of the product
select category.cat_id,category.cat_name, min(t3.min_price) as Min_price from category 
inner join
(select product.cat_id, product.pro_name, t2.* from product
inner join
(select pro_id, min(supp_price) as Min_price from supplier_pricing group by pro_id)
as t2 where t2.pro_id=product.pro_id)
as t3 where t3.cat_id = category.cat_id group by t3.cat_id;


-- 7 Display the Id and Name of the Product ordered after “2021-10-05”.
select * from orders where ord_date > '2021-10-05';

-- 8 Display customer name and gender whose names start or end with character 'A'.
select customer.cus_name,customer.cus_gender from customer where customer.cus_name like 'A%' or customer.cus_name like '%A';


/* 9 Create a stored procedure to display supplier id, name, rating and Type_of_Service. 
For Type_of_Service, If rating =5, print “Excellent Service”,If rating >4 print “Good Service”, 
If rating >2 print “Average Service” else print “Poor Service”.
*/

DELIMITER //
create procedure s_proc()
begin
select report.supp_id, report.supp_name, report.Average,
CASE
WHEN report.Average = 5 THEN 'Excellent service'
WHEN report.Average > 4 THEN 'Good service'
WHEN report.Average > 2 THEN 'Average service'
ELSE 'Poor service'
END AS Type_of_Service from
(select final.supp_id, supplier.supp_name, final.Average from
(select test2.supp_id, avg(test2.rat_ratstars) as Average from
(select supplier_pricing.supp_id, test.ord_id, test.rat_ratstars from
supplier_pricing inner join
(select `orders`.pricing_id, rating.ord_id, rating.rat_ratstars from
`orders`
inner join
rating
on rating.`ord_id` = `orders`.ord_id)
as test
on test.pricing_id = supplier_pricing.pricing_id)
as test2 group by supplier_pricing.supp_id)
as final
inner join
supplier
where final.supp_id = supplier.supp_id) as report;
END //
DELIMITER ;

call s_proc();
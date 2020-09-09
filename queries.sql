--joins
select username, contents 
from users
join posts on posts.user_id = users.id;


-- select * from product;
select category.CategoryName, product.ProductName from product
join category on category.id = product.CategoryId 
order by category.CategoryName;

--adding as to the tables changes the reference to on the sql
--adding as the columns changes the render table name
select c.CategoryName as Category, p.ProductName as Product
from product as p
join category as c
    on c.id = p.CategoryId 
order by c.CategoryName;

--joining more than 2 table
select c.CategoryName as Category, 
    p.ProductName as Product,
    s.CompanyName as Suppliedby
from product as p
join category as c
    on c.id = p.CategoryId 
join supplier as s
    on p.SupplierId = s.id    
order by c.CategoryName;
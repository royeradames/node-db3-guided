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

--return no repeating values
select distinct user_id from posts;

--list all users and post information if available
--list all users that have posts, and all users that do not have posts
select u.username as Writer, p.contents as Quote
from users as u 
left join posts as p 
on p.user_id = u.id;

--list all users that do have posts
select distinct u.username as Writer
from users as u left join posts as p on p.user_id = u.id
where p.contents is null
;

--list all users that don't have post
select distinct u.username as Writer
from users as u left join posts as p on p.user_id = u.id
where p.contents is not null
;

--is === [===]
--is not === !=
--'colums as' does not affect the sql calls only the render name


--list all users that have posts
select distinct u.username
from users as u 
inner join posts as p
    on u.id = p.user_id
order by u.username;

--and all users that do not have posts
select distinct u.username
from users as u
left join posts as p
    on u.id = p.user_id
where p.id is null
order by u.username;    

select user_id, count(*) as total from posts
group by user_id; -- like pilling up coins per denomination

select denomination, sum(value) as total from coins
group by denomination; -- piling up coins per denomination
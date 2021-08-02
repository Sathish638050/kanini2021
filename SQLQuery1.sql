-- Select the author firtname and last name
select au_fname,au_lname from authors

--Sort the titles by the title name in descending order and print all teh details
select * from titles order by title desc

--Print the number of titlespublished by every author
select au_id,count(title_id) 'count of title' from titleauthor group by au_id

--print the author name and title name
select * from authors

--print the publisher name and the average advance for every publisher
select * from publishers


-- print the publishername, author name, title name and the sale amount(qty*price)
select * from titles

--print the price of all that titles that have name that ends with s
select price Book_Price from titles where title like '_s%'

--print the title names that contain 'and' in it
select title from titles where title like '%AND%'

--print the employee name and the publisher name
select * from employee

--print the publisher name and number of employees woking in it if the publisher has more than 2 employees
select pub_name from publishers where pub_id in (select pub_id from employee group by pub_id having count(emp_id) > 2 )

--Print the author names who have published using teh publisher name 'Algodata Infosystems'
select au_fname,au_lname from authors
where au_id in (select au_id from titleauthor 
where title_id in (select title_id from titles 
where pub_id in (select pub_id from publishers 
where pub_name='Algodata Infosystems')))

--Print the employees of the publisher 'Algodata Infosystems'
select * from employee where pub_id in (select pub_id from publishers where pub_name = 'Algodata Infosystems') 

-- Print the average quantity sold for every title where the order date is before '1993-05-24 00:00:00.000'
--and the average is greater than 3
--sort by the average
select * from sales
select * from titles
select * from stores




--Print the count of authors in every state and in each city who have contract(if it is 1) order them by state and then city
select * from authors
select state,city, COUNT(au_id) 'CountOfAuthers' from authors 
where contract = 1 
group by state,city

--Print the author name who have published for pulisher from USA
select au_fname,au_lname from authors
where au_id in (select au_id from titleauthor
where title_id in(select title_id from titles 
where pub_id in (select pub_id from publishers
where country = 'USA')))



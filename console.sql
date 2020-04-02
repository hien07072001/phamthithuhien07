create database sp;
use sp;
 create table Products(
     id int auto_increment primary key ,
     productCode varchar(4),
     productPrice double,
     productAmount double,
     productDescription varchar(200),
     productStatus varchar(10)

);
insert into Products values (1,'100',20,350,'CNTT','new'),
                            (2,'200',12,460,'kHT','old'),
                            (3,'150',22,120,'GGT','old'),
                            (4,'390',32,360,'SAT','new');

#tao unique index;
create unique index index_ten on Products(productCode);
alter table Products add productName varchar(200);

#tao composite index
create index index_ten2 on Products(productName,productPrice);
explain select *from Products where productCode='CNTT';
explain select *from Products where productCode='3';
select *from Products where productCode='3';
#tao view
create view view_product as select  productCode,productName,productPrice,productStatus from Products;
select * from view_product;

#sua doi view
update  view_product set  productPrice='39' where productName='keo bac ha';
 select *from view_product;

#xoa view
 drop view  view_product;

# tao store proceduce;

create procedure priceduce_Products()
    begin
    select *from Products;
    end;

call  priceduce_Products();

#tao store proceduce de them san pham moi

create procedure  insert_products()
begin
    insert into  Products values (4,25,3,'bsc','new','ha');
end;

call insert_products();

select *from Products;

#tao procudece de sua thong tin san pham theo id;

create procedure  update_products()
begin
    update Products set productStatus='new' where id = 4;

end;

call update_products();
select *from Products;

# tao products xoa san pham theo id
 create  procedure delete_products()
 begin
     delete from  Products where  id= 2;
 end;

call delete_products();
select *from  Products;






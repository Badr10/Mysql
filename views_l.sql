create view transaction_view as 
select transaction_item.t_num as t_num , sum(ITEM.price) as total 
from transaction_item,ITEM 
where 
ITEM._id = transaction_item.id group by transaction_item.t_num ;

create view discount as 
select transaction.t_num, customer.cid , customer.dcode , transaction_view.total
from customer,transaction,transaction_view 
where transaction.t_num = transaction_view.t_num
and transaction.cid = customer.cid;


create view purcher as 
  select sum(transaction.sum)as total,cid
  from transaction
 group by cid;
 
      
	create view update_customer as 
      select customer.cid,customer.fname,customer.lname,customer.phone,customer.reg_date , 
      if (purcher.total >500,  customer.dcode=5,
      if (purcher.total between 400 and 500,  customer.dcode=4,
      if (purcher.total between 300 and 399.9,  customer.dcode=3,
      if (purcher.total between 200 and 299.9,  customer.dcode=2,
       if (purcher.total between 100 and 199.9,  customer.dcode=1,
        if (purcher.total between 0 and 99.9,  customer.dcode=0,-1)))))) as decode1
      from purcher, customer 
      where purcher.cid = customer.cid;
 
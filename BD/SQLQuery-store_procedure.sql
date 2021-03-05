create proc getSalesOrder
@fromDate Date,
@toDate Date
as
select  o.order_id, 
    o.order_date,
    c.first_name+', '+c.last_name as customer, 
    products=stuff((select ' - ' +'x'+convert(varchar (10),oi2.quantity)+' '+ product_name 
          from order_items oi2
       inner join products on products.product_id= oi2.product_id 
          where oi2.order_id = oi1.order_id
          for xml path('')), 1, 2, ''),
    sum((quantity*price)-discount)  as total_amount    
from orders o
inner join customers c on c.customer_id=o.customer_id 
inner join order_items oi1 on oi1.order_id =o.order_id 
where o.order_date between @fromDate  and @toDate 
group by o.order_id, oi1.order_id, o.order_date, c.first_name, c.last_name  
order by o.order_id asc
go
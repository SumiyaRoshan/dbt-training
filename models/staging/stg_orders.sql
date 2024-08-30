select
o.ordersellingprice - o.ordercostprice as orderprofit ,
o.ordersellingprice,
o.ordercostprice,
o.orderid,
o.orderdate,
o.shipdate,
o.shipmode,
c.customername,
c.segment,
c.country,
p.category,
p.productname,
p.subcategory,
p.productid,
c.customerid
from {{ ref('raw_orders') }} as o
left join {{ ref('raw_customers') }} as c
on o.customerid = c.customerid
left join {{ ref('raw_products') }} as p
on o.productid = p.productid
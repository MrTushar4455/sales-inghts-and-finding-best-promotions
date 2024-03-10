
select distinct f.product_code, p.product_name, base_price, f.promo_type from fact_events f 
join dim_products as p on f.product_code = p.product_code where base_price > 500 and promo_type = "BOGOF" 

# Used JOIN to join dim products with facts_event table to obtain distinct product name
# Used WHERE to implement the conditions like base_price>500 and promo_type as "BOGOF"


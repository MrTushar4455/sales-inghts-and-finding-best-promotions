SELECT campaign_name,concat(round(sum(base_price * `quantity_sold(before_promo)`)/1000000,2),'M')

 as `Total_Revenue(Before_Promotion)`,
concat(round(sum(
case
when promo_type = "BOGOF" then base_price * 0.5 * 2*(`quantity_sold(after_promo)`)
when promo_type = "50% OFF" then base_price * 0.5 * `quantity_sold(after_promo)`
when promo_type = "25% OFF" then base_price * 0.75* `quantity_sold(after_promo)`
when promo_type = "33% OFF" then base_price * 0.67 * `quantity_sold(after_promo)`
when promo_type = "500 cashback" then (base_price-500)*  `quantity_sold(after_promo)`
end)/1000000,2),'M') as `Total_Revenue(After_Promotion)`
 FROM retail_events_db.fact_events join dim_campaigns c using (campaign_id) group by campaign_id
 
 # SUM - to add all the revenues obtained before promotion
 # ROUND - to round the number to the specified number of decimals
 # CONCAT - to add M (denoting Millions) to the revenue value
 # CASE - to calculate revenue after promotion based on different promo_types
 # JOIN - to join dim_campaigns table with facts table to obtain the campaign_name
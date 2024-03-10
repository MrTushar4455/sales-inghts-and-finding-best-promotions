select City, count(store_id) as Total_Stores from dim_stores group by city order by Total_Stores DESC;

# Used GROUPBY to group stores that belonged to same city
# Used COUNT - to count the number of stores
# used ORDERBY - to arrange the number of stores in an descending order
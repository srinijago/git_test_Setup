view:sql_test{
  derived_table: {
    sql: SELECT distinct
  users.country  AS `country`
FROM demo_db.users  AS users

WHERE
  (users.country LIKE '%' OR users.country LIKE '% %')
GROUP BY 1
ORDER BY users.country
 ;;
}

dimension: country {
  type: string
  sql: ${TABLE}.country ;;
}
}

view: test_dt {
  derived_table: {
    sql:

  SELECT
  users.id  AS `users.id`,
  users.age  AS `users.age`,
  orders.id  AS `orders.id`,
  orders.status  AS `orders.status`
FROM demo_db.order_items  AS order_items
LEFT JOIN demo_db.orders  AS orders ON order_items.order_id = orders.id
LEFT JOIN demo_db.users  AS users ON orders.user_id = users.id
;;
}

dimension: users {
  type: number
  sql: users.id ;;
}
}

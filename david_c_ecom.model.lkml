connection: "thelook"

# include all the views
include: "*.view"
include: "*.dashboard"

datagroup: david_c_ecom_default_datagroup {
  #sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

datagroup: new_orders_since_last_run {
  max_cache_age: "24 hours"
  sql_trigger: SELECT orders.created_at, orders.user_id
  FROM demo_db.order_items  AS order_items
  LEFT JOIN demo_db.orders  AS orders ON order_items.order_id = orders.id
  GROUP BY 1,2
  ORDER BY orders.created_at  DESC
  LIMIT 1;;
}

persist_with: david_c_ecom_default_datagroup

explore: events {
#  fields: [-users.most_recent_purchase]
  join: users {
    type: left_outer
    sql_on: ${events.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: inventory_items {
  join: products {
    type: left_outer
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }
}

explore: order_items {
  join: inventory_items {
    type: left_outer
    sql_on: ${order_items.inventory_item_id} = ${inventory_items.id} ;;
    relationship: many_to_one
  }

  join: orders {
    type: left_outer
    sql_on: ${order_items.order_id} = ${orders.id} ;;
    relationship: many_to_one
  }

  join: products {
    type: left_outer
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }

  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: orders {
  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: products {}

explore: schema_migrations {}

explore: user_data {
 # fields: [-users.most_recent_purchase]
  join: users {
    type: left_outer
    sql_on: ${user_data.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: users {}

explore: users_nn {}

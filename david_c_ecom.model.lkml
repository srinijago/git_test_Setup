connection: "thelook"

# include all the views
include: "*.view"
include: "*.dashboard"

fiscal_month_offset: 2
datagroup: david_c_ecom_default_datagroup {
  #sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

#my comment here

explore: inventory_items {
}

explore: sql_test {}

explore: test_dt {}
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
explore: users {}

explore: products_dt {
  join: products {
    type: left_outer
    sql_on: ${products.brand} = ${products_dt.products_brand} ;;
    relationship: many_to_one
}
}
explore: video_reporting_cdw {
  persist_for: "0 seconds"
  label: "Video Reporting"
  extends: [order_items]
  view_name: order_items
  #fields: [set.client_facing_cdw_star_video*]
  access_filter: {
    field: order_items.mod_1020_repro
    user_attribute: david_repro_mod_1020
  }
  # sql_always_where: ${fact_delivery.event_date} >= TIMESTAMPADD('dd',-737,CURRENT_DATE) ;;
  join: events {}
  hidden: no

#   always_filter: {
#     filters: {
#       field: fact_delivery.event_date
#       value: "1 Days"
#     }
#   }
}

# explore: inventory_items {
#   join: products {
#     type: left_outer
#     sql_on: ${inventory_items.product_id} = ${products.id} ;;
#     relationship: many_to_one
#   }
# }


#testing thisout pls work
explore: order_items {
#   always_filter: {
#     filters: [order_items.returned_date: "1 day"]
#   }
#   sql_always_where:
#   {% condition order_items.date_filter %}
#   ${returned_date}
#   {% endcondition %} ;;
  join: inventory_items {
    from: products
    type: left_outer
    sql_on: ${order_items.inventory_item_id} = ${inventory_items.id} ;;
   # sql_on: ${order_items.inventory_item_id} = ${inventory_items.id} ;;
    relationship: many_to_one
  }

  join: orders {
    type: left_outer
    sql_on: ${order_items.order_id} = ${orders.id} ;;
    relationship: many_to_one
  }

#   join: products {
#     type: left_outer
#     sql_on: ${inventory_items.product_id} = ${products.id} ;;
#     relationship: many_to_one
#   }

  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}


explore: orders {
  sql_always_where: ${orders.status} = {% parameter orders.test_status %}

  ;;
  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

# explore: products {
#   extends: [user_data]
# }

explore: schema_migrations {}

explore: user_data {
  join: users {
    type: left_outer
    sql_on: ${user_data.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}


explore: test_pdt {}


explore: users_nn {}

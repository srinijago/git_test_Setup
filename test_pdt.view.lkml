view: test_pdt {
  derived_table: {
    publish_as_db_view: yes
    sql: SELECT
        order_items.inventory_item_id  AS `order_items.inventory_item_id`,
        order_items.order_id  AS `order_items.order_id`
      FROM demo_db.order_items  AS order_items

      GROUP BY 1,2
      ORDER BY order_items.inventory_item_id
      LIMIT 500
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: order_items_inventory_item_id {
    type: number
    sql: ${TABLE}.`order_items.inventory_item_id` ;;
  }

  dimension: order_items_order_id {
    type: number
    sql: ${TABLE}.`order_items.order_id` ;;
  }

  set: detail {
    fields: [order_items_inventory_item_id, order_items_order_id]
  }
}

view: products_dt {
  derived_table: {
    sql: SELECT
        products.category  AS `products.category`,
        products.department  AS `products.department`,
        products.brand  AS `products.brand`
      FROM demo_db.order_items  AS order_items
      LEFT JOIN demo_db.inventory_items  AS inventory_items ON order_items.inventory_item_id = inventory_items.id
      LEFT JOIN demo_db.products  AS products ON inventory_items.product_id = products.id

      {% if products_dt.product_filter._parameter_value == "'Marketplace'" %}
      WHERE products.brand LIKE ('Aegean' OR 'Alia' OR 'Aloha')
      {% endif %}
      GROUP BY 1,2,3
      ORDER BY products.category
      LIMIT 500
       ;;
  }


  parameter: product_filter {
  type: string
  allowed_value: {
    label: "Marketplace"
    value: "Marketplace"
  }
  }


#   filter: product_filter {
#     type: string
#     suggestions: ["Aegean", "Alia", "Aloha"]
#   }



  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: products_category {
    type: string
    sql: ${TABLE}.`products.category` ;;
  }

  dimension: products_department {
    type: string
    sql: ${TABLE}.`products.department` ;;
  }

  dimension: products_brand {
    type: string
    sql: ${TABLE}.`products.brand` ;;
  }

  set: detail {
    fields: [products_category, products_department, products_brand]
  }
}

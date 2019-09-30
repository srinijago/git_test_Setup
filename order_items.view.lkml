view: order_items {
  sql_table_name: demo_db.order_items ;;

  parameter: date_param {
    type: date
  }

  filter: date_filter {
    type: date
  }

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: mod_1020_repro {
    type: number
    suggestable: no
    hidden: no
    sql:   CASE
             WHEN
              {% condition mod_1020_repro %} ${users.id} {% endcondition %} then ${users.id}
             WHEN
              {% condition mod_1020_repro %} ${order_items.id} {% endcondition %} then ${order_items.id}
             WHEN
              {% condition mod_1020_repro %} ${orders.id} {% endcondition %} then ${orders.id}
           END;;
  }

  filter: mod_1020_repro_filter {
    type: number
    suggestable: no
    #hidden: yes
    sql: (
          {% condition mod_1020_repro %} ${users.id} {% endcondition %}
          OR
          {% condition mod_1020_repro %} ${order_items.id} {% endcondition %}
          OR
          {% condition mod_1020_repro %} ${orders.id} {% endcondition %}
              );;
  }

  dimension: inventory_item_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.inventory_item_id ;;
  }

  dimension: order_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.order_id ;;
  }

  dimension_group: returned {
    type: time
    timeframes: [
      raw,
      time,
      time_of_day,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.returned_at ;;
  }

  dimension: sale_price {
    type: number
    value_format_name: usd
    sql: ${TABLE}.sale_price ;;
  }

  dimension: massive_number {
    type: number
    sql: 123456789012345678901234567890 ;;
  }

  measure: count {
    type: count
    drill_fields: [id, inventory_items.id, orders.id]
  }

  measure: count_null_drill_repro {
    type: count
    drill_fields: [orders.id,returned_date]
  }

  measure: largest_orders {
    type: max
    sql: ${sale_price} ;;
    value_format_name: usd
  }

  measure: average_order_value {
    type: average
    sql: ${sale_price} ;;
    value_format_name: usd
    description: "Same as ADS, just different LookML"
  }

  measure: total_revenue {
    type:  sum
    sql: ${sale_price} ;;
    value_format_name: usd
  }

  measure: average_dollars_per_sale {
    type: number
    sql: ${total_revenue} / ${count} ;;
    description: "Use a time-based metric to see ADS"
    value_format_name: usd
  }
}

view: inventory_items {
  sql_table_name: demo_db.inventory_items ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: cost {
    type: number
    # value_format_name added
    value_format_name: usd
    sql: ${TABLE}.cost ;;
  }

  # case statement added
  dimension: item_cost_type {
    case: {
      when: {
        sql: ${cost} > 250 ;;
        label: "Expensive"
      }
      when: {
        sql: ${cost} > 100 ;;
        label: "Moderate"
      }
      else: "Cheap"
    }
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      hour_of_day,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  parameter: date_granularity {
    type: string
    allowed_value: { value: "Day" }
    allowed_value: { value: "Month" }
    allowed_value: { value: "Quarter" }
    allowed_value: { value: "Year" }
  }

  dimension: date_fix {
    #label_from_parameter: date_granularity
    type: string
    sql:
    CASE
      WHEN {% parameter date_granularity %} = 'Day'
        THEN ${created_date}::VARCHAR
      WHEN {% parameter date_granularity %} = 'Month'
        THEN ${created_month}::VARCHAR
      WHEN {% parameter date_granularity %} = 'Quarter'
        THEN ${created_quarter}::VARCHAR
      WHEN {% parameter date_granularity %} = 'Year'
        THEN ${created_year}::VARCHAR
      ELSE NULL
    END ;;
  }

  dimension: test_c{
    sql: ${date_fix} ;;
  }
  dimension: product_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.product_id ;;
  }


dimension: srinija_unique_test {
  type: number
  # hidden: yes
  sql: ${TABLE}.product_id ;;

}

dimension: test_lol {
  type: number
  sql: ${TABLE}.product_id ;;
}
  # yesno dimension added
  dimension: is_product_expensive {
    type: yesno
    sql: ${cost} >= 100 ;;
  }


  measure: test_max {
    type: max
    #sql: case when ${is_product_expensive} = 'Yes' then ${TABLE}.cost else ${TABLE}.id end   ;;
   # sql:  case when ${TABLE}.cost >= 100 then ${TABLE}.cost else ${TABLE}.id end ;;
    sql:  {% if inventory_items.is_product_expensive  %}
    ${cost}
    {% else %}
    ${id}
    {% endif %};;
  }

  dimension_group: sold {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.sold_at ;;
  }

  measure: count {
    type: count
    link: {
      label: "Drill to Look"
      url:"/looks/10808?&f[inventory_items.id]={{ inventory_items.id._value }}&f[inventory_items.created_date]={{ inventory_items.created_date._value }}&f[product_id]={{ inventory_items.product_id._value }}"
    }
    drill_fields: [id, products.item_name, products.id, order_items.count]
  }
}

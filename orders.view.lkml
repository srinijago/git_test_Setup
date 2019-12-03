view: orders {
  sql_table_name: demo_db.orders ;;

  parameter: is_order_new {
    type: yesno
  }

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
    link: {
      label: "Click me to go to a Dashboard"
      url: "/dashboards/3411?Date={{ _filters['orders.created_date'] }}&Order={{ value }}&User={{ users.id._value}}"
    }
    link: {
      label: "Click me to go to an Explore"
      url: "/explore/david_c_ecom/order_items?fields=users.first_name,users.last_name,users.age,users.city,users.country,users.gender&f[orders.created_date]={{ _filters['orders.created_date'] }}&f[users.id]={{ users.id._value}}&f[orders.id]={{ value }}"
    }
  }

  #my new comment is back

  dimension: action_calc {
    type: number
    sql: case when ${status} = 'complete' then 1
      when ${status} = 'pending' then 2
      else 3 end ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
      day_of_week,
      month_num
    ]
    sql: ${TABLE}.created_at ;;
  }

#  Excel date value formats don't work in the LookML
#   dimension: date_formatted {
#     type: date
#     sql: ${TABLE}.created_at ;;
#     value_format: "m/dd/yyyy"
#   }

  dimension_group: time_since_created {
    type: duration
    sql_start: ${created_raw} ;;
    sql_end: NOW() ;;
    intervals: [year,month,day,hour,minute]
    group_label: "Test2"
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: case_lookml_field {
    case: {
      when: {
        label: "Complete or Cancelled"
        sql: ${status} = "complete" OR ${status} = "cancelled" ;;
      }
      when: {
        label: "Pending"
        sql: ${status} = "pending" ;;
      }
      else: "Boom Shakalaka"
    }
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  measure: count_formatted {
    type: count
    drill_fields: [id, users.first_name, users.last_name, users.id, order_items.count]
    html: {% if orders.status._value == 'complete' and value > 10 %}
          <font color="green">{{ rendered_value }}</font>
          {% else %}
          <font color="black">{{ rendered_value }}</font>
          {% endif %}
          ;;
  }

  measure: 9k {
    type: sum
    sql: 9000 ;;
    value_format: "[>=1000000]0.00,,\"M\";[>=1000]0.00,\"K\";"
  }

  measure: negative_9k {
    type: sum
    sql: -9000 ;;
    value_format: "[abs(>=1000000)]0.00,,\"M\";[abs(>=1000)]0.00,\"K\";"
  }

  measure: count {
    type: count
  }

  measure: count_distinct {
    type: count_distinct
    sql: COALESCE(${id},0) ;;
  }

  measure: count_with_drill {
    type: count
    drill_fields: [id,user_id,status]
  }

  measure: distinct_order_count_month {
    type: count_distinct
    sql: ${id} ;;
    label: "Number of Orders in Last Month"
    filters: {
      field: created_month
      value: "1 month"
    }
  }

  measure: distinct_order_count_sixmo {
    type: count_distinct
    sql: ${id} ;;
    label: "Number of Orders in Last 6 Months"
    filters: {
      field: created_month
      value: "6 Months"
    }
  }

  measure: min_range {
    type: date
    sql: MIN(${created_raw}) ;;
    hidden: yes
  }

  measure: max_range {
    type: date
    sql: MAX(${created_raw}) ;;
    hidden: yes
  }

  measure: date_range {
    type: string
    sql: CONCAT(${min_range}, " to ", ${max_range}) ;;
  }

  # date filtered measures require dimension group timeframe too i.e. created_date/_month/_hour
  measure: test_count_filters_45_days {
    type: count
    filters: {
      field: created_date
      value: "45 days"
    }
  }

#   Can't filter a measure by another measure
#   measure: filtered_count_on_measure {
#     type: count_distinct
#     sql: ${user_id} ;;
#     filters: {
#       field: count
#       value: ">6"
#     }
#   }

  measure: status_filtered_measure_count {
    type: count
    filters: {
      field: status
      value: "complete,null"
    }
  }

  measure: percent_of_orders {
    type: number
    sql: (${distinct_order_count_month}/${distinct_order_count_sixmo}) *100;;
    value_format: "0.00\%"
  }
}

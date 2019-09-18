view: orders {
  sql_table_name: demo_db.orders ;;

  parameter: is_order_new {
    type: yesno
  }

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

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

  measure: count {
    type: count
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

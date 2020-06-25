view: orders {
  sql_table_name: demo_db.orders ;;

  parameter: is_order_new {
    type: string
    allowed_value: {
      label: "Yes"
      value: "Yes"
    }
    allowed_value: {
      label: "No"
      value: "No"
    }
# suggest_dimension: status
  }



  dimension: id_with_html {
    #primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
    # link: {
    #   label: "Click me to go to a Dashboard"
    #   url: "/dashboards/3411?Date={{ _filters['orders.created_date'] }}&Order={{ value }}&User={{ users.id._value}}"
    # }
    html: <a href="https://master.looker.com/dashboards/3411?Date={{ _filters['orders.created_date'] }}&Order={{ value }}&User={{ users.id._value}}">{{rendered_value}}</a> ;;
  }

  dimension: id_string_hopefully {
    type: string
    sql: ${TABLE}.id ;;
  }

  measure: sum_id {
    type: sum
    sql: ${id_string_hopefully} ;;
  }

  filter: date_filter_field {
    type: date
  }

  filter: string_filter_field {
    type: string
    #sql: {% condition string_filter_field %} ${id} {% endcondition %} ;;
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
      second,
      year,
      day_of_week,
      month_num, fiscal_month_num,fiscal_quarter,fiscal_quarter_of_year,fiscal_year, month_name
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension: test_lol {
    sql: {% date_end created_date %}  ;;
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

  parameter: test_status {
    type: string
    suggest_dimension: status
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
    value_format_name: decimal_0
    drill_fields: [id, users.first_name, users.last_name, users.id, order_items.count]
    }

    html: {% if orders.status._value == 'complete' and value > 10 %}
          <font color="green">{{ rendered_value }}</font>
          {% else %}
          <font color="black">{{ rendered_value }}</font>
          {% endif %}
          ;;
    link: {
      label: "Google Boi"
      url: "https://www.google.com"
    }
  }

  measure: 9k {
    type: sum
    sql: 9000 ;;
    value_format: "[>=1000000]0.00,,\"M\";[>=1000]0.00,\"K\";"
  }

  measure: drill_filtered_measure {
    type: count
    drill_fields: [id,user_id,created_date]
    filters: {
      field: user_id
      value: ">123"
    }
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
    hidden: no
  }

  measure: max_range {
    type: date
    sql: MAX(${created_raw}) ;;
    hidden: no
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

  # measure: order_items_distinct_count {
  #   type: count_distinct
  #   sql: ${order_items.id} ;;
  # }

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

  measure: sum_of_id_with_drill {
    type: sum
    sql: ${id} ;;
    link: {
      url: "{{dummy._link}}&sorts=orders.status+asc"
      label: "Click Me"
    }
  }

  measure: dummy {
    type: sum
    hidden: yes
    sql: 0 ;;
    drill_fields: [id,created_date,status,count]
  }

view: orders_dt {
  derived_table: {
    sql: SELECT created_at, id FROM orders WHERE {% condition orders.date_filter %} created_at {% endcondition %} ;;
  }

  dimension_group: created {
    type: time
    #convert_tz: yes
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
      month_num
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension: id {
    type: number
    primary_key: yes
    sql: ${TABLE}.id ;;
  }
 }

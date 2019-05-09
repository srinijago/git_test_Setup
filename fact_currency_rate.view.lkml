view: fact_currency_rate {
  sql_table_name: stars.FactCurrencyRate ;;

  dimension: average_rate {
    type: number
    sql: ${TABLE}.AverageRate ;;
  }

  dimension: currency_key {
    type: number
    sql: ${TABLE}.CurrencyKey ;;
  }

  dimension: date_key {
    type: number
    sql: ${TABLE}.DateKey ;;
  }

  dimension: end_of_day_rate {
    type: number
    sql: ${TABLE}.EndOfDayRate ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}

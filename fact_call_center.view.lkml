view: fact_call_center {
  sql_table_name: stars.FactCallCenter ;;

  dimension: fact_call_center_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.FactCallCenterID ;;
  }

  dimension: automatic_responses {
    type: number
    sql: ${TABLE}.AutomaticResponses ;;
  }

  dimension: average_time_per_issue {
    type: number
    sql: ${TABLE}.AverageTimePerIssue ;;
  }

  dimension: calls {
    type: number
    sql: ${TABLE}.Calls ;;
  }

  dimension: date_key {
    type: number
    sql: ${TABLE}.DateKey ;;
  }

  dimension: issues_raised {
    type: number
    sql: ${TABLE}.IssuesRaised ;;
  }

  dimension: level_one_operators {
    type: number
    sql: ${TABLE}.LevelOneOperators ;;
  }

  dimension: level_two_operators {
    type: number
    sql: ${TABLE}.LevelTwoOperators ;;
  }

  dimension: orders {
    type: number
    sql: ${TABLE}.Orders ;;
  }

  dimension: service_grade {
    type: number
    sql: ${TABLE}.ServiceGrade ;;
  }

  dimension: shift {
    type: string
    sql: ${TABLE}.Shift ;;
  }

  dimension: total_operators {
    type: number
    sql: ${TABLE}.TotalOperators ;;
  }

  dimension: wage_type {
    type: string
    sql: ${TABLE}.WageType ;;
  }

  measure: count {
    type: count
    drill_fields: [fact_call_center_id]
  }
}

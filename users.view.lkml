view: users {
  sql_table_name: demo_db.users ;;

  parameter: user_info_type {
    type: unquoted
    allowed_value: { label: "State" value: "state" }
    allowed_value: { label: "Age" value: "age" }
    allowed_value: { label: "ID" value: "id" }
    allowed_value: { label: "Last Name" value: "last_name" }
  }

  dimension: user_info {
    type: string
    sql:
    {% if user_info_type._parameter_value == "state" %}
     ${state}
    {% elsif user_info_type._parameter_value == "age" %}
     ${age}
    {% elsif user_info_type._parameter_value == "id" %}
     ${id}
    {% elsif user_info_type._parameter_value == "last_name" %}
     ${last_name}
    {% endif %} ;;
  }

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  filter: end_date {
    type: string
  }

filter: start_date {
  label: " Start Date"
  type: string
}
  dimension: id_with_link {
    type: number
    sql: ${TABLE}.id ;;
    link: {
      label: "Drill to Look with Filter"
      url: "/looks/8856?&f[users.id]={{value}}"
    }
  }

  dimension: age {
    type: number
    sql: ${TABLE}.age ;;
#     html:
#     {% if value > 40 %}
#     <p style="color:red; text-align:center">{{ rendered_value }}</p>
#     {% else %}
#     <p style="color: green; text-align:center">{{ rendered_value }}</p>
#     {% endif %}
#     ;;
  html: <a href="/explore/david_c_ecom/order_items?&f[users.age]={{ value }}">{{ value }}</a> ;;


  }

filter: tst_ristrct {
  type: string
}
  dimension: age_1 {
    type: number
    sql: ${age} +1 ;;
  }

  measure: test_dim {
    type: number
    sql: ${average_test} * ${age_1} ;;
  }

  measure: sum_age{
    type: sum
    sql: ${age} ;;
  }

measure: sum_age1 {
  type: sum
  sql: ${age_1} ;;
}

measure: division{
  type: number
  sql: ${sum_age1}/${sum_age} ;;
}

  dimension: age_tier {
    type: tier
    tiers: [15, 25, 35, 45, 55, 65, 75, 85, 95, 105]
    style: integer
    sql: ${age} ;;
  }

  dimension: city {
    type: string
    label: "city test"
    sql: ${TABLE}.city ;;
  }

  measure: city_count {
    type: number
    sql: COUNT(${city}) ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
    suggest_explore: sql_test
    suggest_dimension: sql_test.country
    suggest_persist_for: "1 minute"
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
      year
    ]
    label: "time2"
    sql: ${TABLE}.created_at ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: full_name {
    type:  string
    sql: CONCAT(${first_name}, " ", ${last_name}) ;;
  }

  measure: test_mea {
    type: sum_distinct
    sql: ${age} ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
   # map_layer_name: us_states
  }

  dimension: zip {
    type: zipcode
    sql: ${TABLE}.zip ;;
  }


measure: string_state {
  type: string
  sql: ${state} ;;
}
measure: case_test {
  type: number
#   sql: {% if ${string_state} == "California" %}
#   ${count}
#   {% elsif ${string_state} == "Alaska" %}
#   ${average_test}
#   {% endif %} ;;
sql: CASE WHEN ${TABLE}.state = 'California' then ${count}
 WHEN ${TABLE}.state = 'Alaska' then ${average_test}
ELSE 0
END ;;
}

  measure: count {
    type: count
  }

  measure: average_test {
    type: average
    sql: ${id} ;;
  }

#   measure: most_recent_purchase {
#     type: date
#     sql: MAX(${orders.created_date}}) ;;
#     convert_tz: no
#   }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      id2*,
      first_name,
      last_name,
      events.count,
      orders.count,
      user_data.count
    ]
  }
  set: id2 {
    fields: [
      age,
      email
    ]
  }
}

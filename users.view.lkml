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
    link: {
      url: "https://www.google.com/{{ users.id._value }}"
      label: "Click Me {{ users.age._value }}"
    }
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
  }

  dimension: age_tier {
    type: tier
    tiers: [15, 25, 35, 45, 55, 65, 75, 85, 95, 105]
    style: integer
    sql: ${age} ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
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

  filter: first_name_suggest_test {
    type: string
    suggest_dimension: first_name
   # suggest_explore: order_items
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
    map_layer_name: us_states
  }

  dimension: zip {
    type: zipcode
    sql: ${TABLE}.zip ;;
  }

  dimension: zip_with_link {
    type: zipcode
    sql: ${TABLE}.zip ;;
    link: {
      url: "https://www.google.com/{{ users.id._value }}"
      label: "Click Me {{ users.id._value }}"
    }
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: sum_test {
    type: count_distinct
    sql: ${id} ;;
    drill_fields: [id,count]
    link: {
      url: "{{dummy._link}}&sorts=id+asc"
    }
  }

  measure: dummy {
    type: sum
    sql: 0 ;;
    drill_fields: [id,count]
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

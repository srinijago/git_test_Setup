view: dynamic_derived_table {
  derived_table: {
    sql: SELECT
        CONCAT(users.first_name, " ", users.last_name)  AS `users.full_name`,
        DATE(CONVERT_TZ(orders.created_at ,'UTC','America/Los_Angeles')) AS `orders.created_date`
      FROM demo_db.order_items  AS order_items
      LEFT JOIN demo_db.orders  AS orders ON order_items.order_id = orders.id
      LEFT JOIN demo_db.users  AS users ON orders.user_id = users.id
      WHERE {% condition date_filter %} orders.created_at {% endcondition %}
      GROUP BY 1,2
      ORDER BY 2 DESC
       ;;
  }

  filter: date_filter {
    type: date
  }

  filter: name_filter {
    type: string
    suggest_dimension: users_full_name
    sql: {% condition name_filter %} ${users_full_name} {% endcondition %} ;;
  }

  parameter: parameter {
    type: unquoted
    label: "US or EU?"
    allowed_value: {
      label: "US"
      value: "US"
    }
    allowed_value: {
      label: "EU"
      value: "EU"
    }
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: users_full_name {
    type: string
    sql: ${TABLE}.`users.full_name` ;;
  }

  dimension: orders_created_date {
    type: date
    sql: ${TABLE}.`orders.created_date` ;;
    html: {% if parameter._parameter_value == "US" %}
    {{ rendered_value | date: "%m/%d/%Y" }}
    {% else %}
    {{ rendered_value | date: "%d/%m/%Y" }}
    {% endif %};;
  }

  set: detail {
    fields: [users_full_name, orders_created_date]
  }
}

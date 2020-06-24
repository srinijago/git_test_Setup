view: liquid_table_name {

sql_table_name:
{% if table_selector._parameter_value == "table_1" %}
demo_db.order_items
{% elsif table_selector._parameter_value == "table_2" %}
demo_db.orders
{% else %}
demo_db.users
{% endif %};;


  parameter: table_selector {
    type: unquoted
    allowed_value: {
      label: "Table 1"
      value: "table_1"
    }
    allowed_value: {
      label: "Table 2"
      value: "table_2"
    }
  }
}

view: products {
  sql_table_name: demo_db.products ;;

  dimension: id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.id ;;
    html: {% if value <= 15 %}
            <p><font size="10" color="red" valign="middle" text-align="center">&bull</font></p>
          {% elsif value > 15 and value < 29 %}
            <p><font size="10" color="#ffc200" valign="middle" text-align="center">&bull</font></p>
          {% elsif value >= 29 and value <= 37 %}
            <p><font size="10" color="#61b202" valign="middle" text-align="center">&bull</font></p>
          {% else %}
            <p><font size="10" color="gray" valign="middle" text-align="center">&bull</font></p>
          {% endif %} ;;
  }

  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
  }

  filter: date_test {
    type: date
  }

  dimension: brand_with_quotes {
    type: string
    sql: CONCAT("\"\"\"",${TABLE}.brand, "\"\"\"") ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: department {
    type: string
    sql: ${TABLE}.department ;;
  }

  dimension: item_name {
    type: string
    sql: ${TABLE}.item_name ;;
  }

  dimension: rank {
    type: number
    sql: ${TABLE}.rank ;;
  }

  dimension: retail_price {
    type: number
    sql: ${TABLE}.retail_price ;;
  }

  dimension: sku {
    type: string
    sql: ${TABLE}.sku ;;
  }

  measure: count {
    type: count
    value_format_name: usd
    drill_fields: [id, item_name, inventory_items.count]
  }
}

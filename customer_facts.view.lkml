view: customer_facts {
  derived_table: {
    sql: select salesordernumber, customerkey, RANK() OVER (PARTITION BY customerkey ORDER BY salesordernumber) AS Rank
      from stars.FactInternetSales
      where customerkey IN (18759, 15251)
      GROUP BY salesordernumber, customerkey
      order by customerkey desc
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: salesordernumber {
    type: string
    sql: ${TABLE}.salesordernumber ;;
  }

  dimension: customerkey {
    type: string
    sql: ${TABLE}.customerkey ;;
  }

  dimension: rank {
    type: string
    sql: ${TABLE}.Rank ;;
  }

  set: detail {
    fields: [salesordernumber, customerkey, rank]
  }
}

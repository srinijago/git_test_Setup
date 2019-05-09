view: fact_internet_sales {
  sql_table_name: stars.FactInternetSales ;;

  dimension: carrier_tracking_number {
    type: string
    sql: ${TABLE}.CarrierTrackingNumber ;;
  }

  dimension: currency_key {
    type: number
    sql: ${TABLE}.CurrencyKey ;;
  }

  dimension: customer_key {
    type: number
    sql: ${TABLE}.CustomerKey ;;
  }

  dimension: customer_ponumber {
    type: string
    sql: ${TABLE}.CustomerPONumber ;;
  }

  dimension: discount_amount {
    type: number
    sql: ${TABLE}.DiscountAmount ;;
  }

  dimension: due_date_key {
    type: number
    sql: ${TABLE}.DueDateKey ;;
  }

  dimension: extended_amount {
    type: string
    sql: ${TABLE}.ExtendedAmount ;;
  }

  dimension: freight {
    type: string
    sql: ${TABLE}.Freight ;;
  }

  dimension: order_date_key {
    type: number
    sql: ${TABLE}.OrderDateKey ;;
  }

  dimension: order_quantity {
    type: number
    sql: ${TABLE}.OrderQuantity ;;
  }

  dimension: product_key {
    type: number
    sql: ${TABLE}.ProductKey ;;
  }

  dimension: product_standard_cost {
    type: string
    sql: ${TABLE}.ProductStandardCost ;;
  }

  dimension: promotion_key {
    type: number
    sql: ${TABLE}.PromotionKey ;;
  }

  dimension: revision_number {
    type: number
    sql: ${TABLE}.RevisionNumber ;;
  }

  dimension: sales_amount {
    type: string
    sql: ${TABLE}.SalesAmount ;;
  }

  dimension: sales_order_line_number {
    type: number
    sql: ${TABLE}.SalesOrderLineNumber ;;
  }

  dimension: sales_order_number {
    type: string
    primary_key: yes
    sql: ${TABLE}.SalesOrderNumber ;;
  }

  dimension: sales_territory_key {
    type: number
    sql: ${TABLE}.SalesTerritoryKey ;;
  }

  dimension: ship_date_key {
    type: number
    sql: ${TABLE}.ShipDateKey ;;
  }

  dimension: tax_amt {
    type: string
    sql: ${TABLE}.TaxAmt ;;
  }

  dimension: total_product_cost {
    type: string
    sql: ${TABLE}.TotalProductCost ;;
  }

  dimension: unit_price {
    type: string
    sql: ${TABLE}.UnitPrice ;;
  }

  dimension: unit_price_discount_pct {
    type: number
    sql: ${TABLE}.UnitPriceDiscountPct ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}

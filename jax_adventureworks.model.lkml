connection: "jax-azure-adventureworks"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

explore: sales {
  from: fact_internet_sales
  join: dim_sales_territory {
    relationship: many_to_one
    type: left_outer
    sql_on: ${sales.sales_territory_key} = ${dim_sales_territory.sales_territory_key};;
  }

  join: dim_promotion {
    relationship: many_to_one
    type: left_outer
    sql_on: ${sales.promotion_key} = ${dim_promotion.promotion_key};;
  }

  join: dim_product {
    relationship: many_to_one
    type: left_outer
    sql_on: ${sales.product_key} = ${dim_product.product_key} ;;
  }

  join: dim_customer {
    view_label: "Customers"
    relationship: many_to_one
    type: left_outer
    sql_on: ${sales.customer_key} = ${dim_customer.customer_key} ;;
  }

  join: dim_geography {
    relationship: many_to_one
    type: left_outer
    sql_on: ${dim_customer.geography_key}=${dim_geography.geography_key} ;;
  }

  join: sales_date {
    view_label: "Sales"
    from: dim_date
    relationship: many_to_one
    type: left_outer
    sql_on: ${sales.order_date_key} = ${sales_date.date_key} ;;
  }
}

explore: prospective_buyer {}

connection: "jax-azure-adventureworks"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

explore: adventure_works_dwbuild_version {}

explore: database_log {}

explore: dim_account {}

explore: dim_currency {}

explore: dim_customer {}

explore: dim_date {}

explore: dim_department_group {}

explore: dim_employee {}

explore: dim_geography {}

explore: dim_organization {}

explore: dim_product {}

explore: dim_product_category {}

explore: dim_product_subcategory {}

explore: dim_promotion {}

explore: dim_reseller {}

explore: dim_sales_reason {}

explore: dim_sales_territory {}

explore: dim_scenario {}

explore: fact_call_center {}

explore: fact_currency_rate {}

explore: fact_finance {}

explore: fact_internet_sales {}

explore: fact_internet_sales_reason {}

explore: fact_reseller_sales {}

explore: fact_sales_quota {}

explore: fact_survey_response {}

explore: prospective_buyer {}

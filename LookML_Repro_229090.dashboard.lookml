- dashboard: lookml_dashboard_repro_229090
  title: LookML Dashboard Repro 229090
  layout: newspaper
  elements:
  - title: Only Showing First 20 Rows
    name: Only Showing First 20 Rows
    model: david_c_ecom
    explore: order_items
    type: table
    fields: [orders.created_date, order_items.count, orders.count]
    sorts: [orders.created_date desc]
    limit: 500
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: true
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '20'
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    row: 0
    col: 0
    width: 8
    height: 6

- dashboard: grab_my_lookml
  title: Grab My LookML
  layout: newspaper
  elements:
  - title: Model with Period
    name: Model with Period
    model: some.model_name
    explore: model_with_period
    type: table
    fields: [orders.created_year, orders.status, orders.count]
    sorts: [orders.created_year desc]
    limit: 500
    query_timezone: America/Los_Angeles
    row: 0
    col: 0
    width: 8
    height: 6

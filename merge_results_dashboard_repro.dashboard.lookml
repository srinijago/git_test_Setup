- dashboard: merge_results_dashboard_repro
  title: Merge Results Dashboard Repro
  layout: newspaper
  elements:
  - name: Tile 1 5 queries
    title: Tile 1 5 queries
    merged_queries:
    - model: david_c_ecom
      explore: order_items
      type: table
      fields: [users.id, users.gender]
      sorts: [users.id]
      limit: 5000
      query_timezone: America/Los_Angeles
    - model: david_c_ecom
      explore: order_items
      type: table
      fields: [users.id, users.first_name]
      sorts: [users.id]
      limit: 500
      query_timezone: America/Los_Angeles
      join_fields:
      - field_name: users.id
        source_field_name: users.id
    - model: david_c_ecom
      explore: order_items
      type: table
      fields: [users.id, users.last_name]
      sorts: [users.id]
      limit: 500
      query_timezone: America/Los_Angeles
      join_fields:
      - field_name: users.id
        source_field_name: users.id
    - model: david_c_ecom
      explore: order_items
      type: table
      fields: [users.id, users.email, users.age]
      sorts: [users.id]
      limit: 500
      query_timezone: America/Los_Angeles
      join_fields:
      - field_name: users.id
        source_field_name: users.id
    - model: david_c_ecom
      explore: order_items
      type: table
      fields: [users.id, users.id_with_link, users.age_tier]
      sorts: [users.id]
      limit: 500
      query_timezone: America/Los_Angeles
      join_fields:
      - field_name: users.id
        source_field_name: users.id
    type: table
    row: 0
    col: 0
    width: 13
    height: 6
  - name: Tile 1 5 queries lower limit
    title: Tile 1 5 queries
    merged_queries:
    - model: david_c_ecom
      explore: order_items
      type: table
      fields: [users.id, users.gender]
      sorts: [users.id]
      limit: 500
      query_timezone: America/Los_Angeles
    - model: david_c_ecom
      explore: order_items
      type: table
      fields: [users.id, users.first_name]
      sorts: [users.id]
      limit: 5000
      query_timezone: America/Los_Angeles
      join_fields:
      - field_name: users.id
        source_field_name: users.id
    - model: david_c_ecom
      explore: order_items
      type: table
      fields: [users.id, users.last_name]
      sorts: [users.id]
      limit: 5000
      query_timezone: America/Los_Angeles
      join_fields:
      - field_name: users.id
        source_field_name: users.id
    - model: david_c_ecom
      explore: order_items
      type: table
      fields: [users.id, users.email, users.age]
      sorts: [users.id]
      limit: 5000
      query_timezone: America/Los_Angeles
      join_fields:
      - field_name: users.id
        source_field_name: users.id
    - model: david_c_ecom
      explore: order_items
      type: table
      fields: [users.id, users.id_with_link, users.age_tier]
      sorts: [users.id]
      limit: 5000
      query_timezone: America/Los_Angeles
      join_fields:
      - field_name: users.id
        source_field_name: users.id
    type: table
    row: 0
    col: 0
    width: 13
    height: 6
  - name: Tile 2 5 Queries
    title: Tile 2 5 Queries
    merged_queries:
    - model: system__activity
      explore: group
      type: table
      fields: [user.email, indirect_group.count]
      sorts: [indirect_group.count desc]
      limit: 503
      join_fields: []
    - model: system__activity
      explore: history
      type: table
      fields: [history.query_run_count, user.email]
      limit: 507
      join_fields:
      - field_name: user.email
        source_field_name: user.email
        __FILE: dcl_tiny_dashboard/merge_madness.dashboard.lookml
        __LINE_NUM: 97
    - model: system__activity
      explore: dashboard
      type: table
      fields: [filtered_history_dashboards.dashboards_used_last_30, user.email]
      sorts: [user.email]
      limit: 500
      join_fields:
      - field_name: user.email
        source_field_name: user.email
        __FILE: dcl_tiny_dashboard/merge_madness.dashboard.lookml
        __LINE_NUM: 106
    - model: system__activity
      explore: event
      type: table
      fields: [user.email, event.count]
      sorts: [event.count desc]
      limit: 510
      join_fields:
      - field_name: user.email
        source_field_name: user.email
        __FILE: dcl_tiny_dashboard/merge_madness.dashboard.lookml
        __LINE_NUM: 115
    - model: system__activity
      explore: space
      type: table
      fields: [user.email, space.count]
      sorts: [space.count desc]
      limit: 508
      join_fields:
      - field_name: user.email
        source_field_name: user.email
        __FILE: dcl_tiny_dashboard/merge_madness.dashboard.lookml
        __LINE_NUM: 124
    type: table
    column_limit: 50
    row: 6
    col: 0
    width: 13
    height: 6
  - title: Tile 3 1 query
    name: Tile 3 1 query
    model: david_c_ecom
    explore: order_items
    type: single_value
    fields: [orders.count]
    limit: 500
    query_timezone: America/Los_Angeles
    series_types: {}
    row: 0
    col: 13
    width: 6
    height: 4
  - title: Tile 4 1 Query
    name: Tile 4 1 Query
    model: david_c_ecom
    explore: order_items
    type: table
    fields: [orders.count_formatted]
    limit: 500
    query_timezone: America/Los_Angeles
    series_types: {}
    row: 0
    col: 19
    width: 5
    height: 4
  - title: Tile 5 1 Query
    name: Tile 5 1 Query
    model: david_c_ecom
    explore: order_items
    type: table
    fields: [orders.distinct_order_count_sixmo]
    limit: 500
    query_timezone: America/Los_Angeles
    series_types: {}
    row: 4
    col: 13
    width: 11
    height: 2
  - name: Tile 6 4 queries
    title: Tile 6 4 queries
    merged_queries:
    - model: david_c_ecom
      explore: order_items
      type: table
      fields: [orders.id, order_items.average_order_value, order_items.count]
      sorts: [orders.id]
      limit: 500
      query_timezone: America/Los_Angeles
      series_types: {}
    - model: david_c_ecom
      explore: order_items
      type: table
      fields: [orders.id, orders.created_date]
      sorts: [orders.id]
      limit: 500
      query_timezone: America/Los_Angeles
      join_fields:
      - field_name: orders.id
        source_field_name: orders.id
    - model: david_c_ecom
      explore: order_items
      type: table
      fields: [orders.id, orders.days_time_since_created, orders.user_id]
      sorts: [orders.id]
      limit: 500
      query_timezone: America/Los_Angeles
      join_fields:
      - field_name: orders.id
        source_field_name: orders.id
    - model: david_c_ecom
      explore: order_items
      type: table
      fields: [orders.id, users.zip]
      sorts: [orders.id]
      limit: 500
      query_timezone: America/Los_Angeles
      join_fields:
      - field_name: orders.id
        source_field_name: orders.id
    type: table
    row: 6
    col: 13
    width: 11
    height: 6
  - name: New Tile 1
    title: New Tile 1
    merged_queries:
    - model: system__activity
      explore: group
      type: table
      fields: [user.email, indirect_group.count]
      sorts: [indirect_group.count desc]
      limit: 911
      join_fields: []
    - model: system__activity
      explore: history
      type: table
      fields: [history.query_run_count, user.email]
      limit: 643
      join_fields:
      - field_name: user.email
        source_field_name: user.email
        __FILE: dcl_tiny_dashboard/merge_madness.dashboard.lookml
        __LINE_NUM: 244
    - model: system__activity
      explore: dashboard
      type: table
      fields: [filtered_history_dashboards.dashboards_used_last_30, user.email]
      sorts: [user.email]
      limit: 120
      join_fields:
      - field_name: user.email
        source_field_name: user.email
        __FILE: dcl_tiny_dashboard/merge_madness.dashboard.lookml
        __LINE_NUM: 253
    - model: system__activity
      explore: event
      type: table
      fields: [user.email, event.count]
      sorts: [event.count desc]
      limit: 563
      join_fields:
      - field_name: user.email
        source_field_name: user.email
        __FILE: dcl_tiny_dashboard/merge_madness.dashboard.lookml
        __LINE_NUM: 262
    - model: system__activity
      explore: space
      type: table
      fields: [user.email, space.count]
      sorts: [space.count desc]
      limit: 409
      join_fields:
      - field_name: user.email
        source_field_name: user.email
        __FILE: dcl_tiny_dashboard/merge_madness.dashboard.lookml
        __LINE_NUM: 271
    type: table
    column_limit: 50
    row: 12
    col: 0
    width: 8
    height: 6
  - name: New Tile 2
    title: New Tile 2
    merged_queries:
    - model: system__activity
      explore: group
      type: table
      fields: [user.email, indirect_group.count]
      sorts: [indirect_group.count desc]
      limit: 212
      join_fields: []
    - model: system__activity
      explore: history
      type: table
      fields: [history.query_run_count, user.email]
      limit: 118
      join_fields:
      - field_name: user.email
        source_field_name: user.email
        __FILE: dcl_tiny_dashboard/merge_madness.dashboard.lookml
        __LINE_NUM: 195
    - model: system__activity
      explore: dashboard
      type: table
      fields: [filtered_history_dashboards.dashboards_used_last_30, user.email]
      sorts: [user.email]
      limit: 2013
      join_fields:
      - field_name: user.email
        source_field_name: user.email
        __FILE: dcl_tiny_dashboard/merge_madness.dashboard.lookml
        __LINE_NUM: 204
    - model: system__activity
      explore: event
      type: table
      fields: [user.email, event.count]
      sorts: [event.count desc]
      limit: 558
      join_fields:
      - field_name: user.email
        source_field_name: user.email
        __FILE: dcl_tiny_dashboard/merge_madness.dashboard.lookml
        __LINE_NUM: 213
    - model: system__activity
      explore: space
      type: table
      fields: [user.email, space.count]
      sorts: [space.count desc]
      limit: 716
      join_fields:
      - field_name: user.email
        source_field_name: user.email
        __FILE: dcl_tiny_dashboard/merge_madness.dashboard.lookml
        __LINE_NUM: 222
    type: table
    column_limit: 50
    row: 12
    col: 8
    width: 8
    height: 6
  - name: New Tile 123
    title: New Tile 123
    merged_queries:
    - model: system__activity
      explore: group
      type: table
      fields: [user.email, indirect_group.count]
      sorts: [indirect_group.count desc]
      limit: 513
      join_fields: []
    - model: system__activity
      explore: history
      type: table
      fields: [history.query_run_count, user.email]
      limit: 515
      join_fields:
      - field_name: user.email
        source_field_name: user.email
        __FILE: dcl_tiny_dashboard/merge_madness.dashboard.lookml
        __LINE_NUM: 146
    - model: system__activity
      explore: dashboard
      type: table
      fields: [filtered_history_dashboards.dashboards_used_last_30, user.email]
      sorts: [user.email]
      limit: 522
      join_fields:
      - field_name: user.email
        source_field_name: user.email
        __FILE: dcl_tiny_dashboard/merge_madness.dashboard.lookml
        __LINE_NUM: 155
    - model: system__activity
      explore: event
      type: table
      fields: [user.email, event.count]
      sorts: [event.count desc]
      limit: 544
      join_fields:
      - field_name: user.email
        source_field_name: user.email
        __FILE: dcl_tiny_dashboard/merge_madness.dashboard.lookml
        __LINE_NUM: 164
    - model: system__activity
      explore: space
      type: table
      fields: [user.email, space.count]
      sorts: [space.count desc]
      limit: 591
      join_fields:
      - field_name: user.email
        source_field_name: user.email
        __FILE: dcl_tiny_dashboard/merge_madness.dashboard.lookml
        __LINE_NUM: 173
    type: table
    column_limit: 50
    row: 12
    col: 16
    width: 8
    height: 6
  - name: New Tile 456
    title: New Tile 456
    merged_queries:
    - model: system__activity
      explore: group
      type: table
      fields: [user.email, indirect_group.count]
      sorts: [indirect_group.count desc]
      limit: 112
      join_fields: []
    - model: system__activity
      explore: history
      type: table
      fields: [history.query_run_count, user.email]
      limit: 113
      join_fields:
      - field_name: user.email
        source_field_name: user.email
        __FILE: dcl_tiny_dashboard/merge_madness.dashboard.lookml
        __LINE_NUM: 293
    - model: system__activity
      explore: dashboard
      type: table
      fields: [filtered_history_dashboards.dashboards_used_last_30, user.email]
      sorts: [user.email]
      limit: 114
      join_fields:
      - field_name: user.email
        source_field_name: user.email
        __FILE: dcl_tiny_dashboard/merge_madness.dashboard.lookml
        __LINE_NUM: 302
    - model: system__activity
      explore: event
      type: table
      fields: [user.email, event.count]
      sorts: [event.count desc]
      limit: 115
      join_fields:
      - field_name: user.email
        source_field_name: user.email
        __FILE: dcl_tiny_dashboard/merge_madness.dashboard.lookml
        __LINE_NUM: 311
    - model: system__activity
      explore: space
      type: table
      fields: [user.email, space.count]
      sorts: [space.count desc]
      limit: 116
      join_fields:
      - field_name: user.email
        source_field_name: user.email
        __FILE: dcl_tiny_dashboard/merge_madness.dashboard.lookml
        __LINE_NUM: 320
    type: table
    column_limit: 50
    row: 18
    col: 0
    width: 8
    height: 6
  - name: New Tile 789
    title: New Tile 789
    merged_queries:
    - model: system__activity
      explore: group
      type: table
      fields: [user.email, indirect_group.count]
      sorts: [indirect_group.count desc]
      limit: 501
      join_fields: []
    - model: system__activity
      explore: history
      type: table
      fields: [history.query_run_count, user.email]
      limit: 501
      join_fields:
      - field_name: user.email
        source_field_name: user.email
        __FILE: dcl_tiny_dashboard/merge_madness.dashboard.lookml
        __LINE_NUM: 342
    - model: system__activity
      explore: dashboard
      type: table
      fields: [filtered_history_dashboards.dashboards_used_last_30, user.email]
      sorts: [user.email]
      limit: 500
      join_fields:
      - field_name: user.email
        source_field_name: user.email
        __FILE: dcl_tiny_dashboard/merge_madness.dashboard.lookml
        __LINE_NUM: 351
    - model: system__activity
      explore: event
      type: table
      fields: [user.email, event.count]
      sorts: [event.count desc]
      limit: 500
      join_fields:
      - field_name: user.email
        source_field_name: user.email
        __FILE: dcl_tiny_dashboard/merge_madness.dashboard.lookml
        __LINE_NUM: 360
    - model: system__activity
      explore: space
      type: table
      fields: [user.email, space.count]
      sorts: [space.count desc]
      limit: 500
      join_fields:
      - field_name: user.email
        source_field_name: user.email
        __FILE: dcl_tiny_dashboard/merge_madness.dashboard.lookml
        __LINE_NUM: 369
    type: table
    column_limit: 50
    row: 18
    col: 8
    width: 8
    height: 6
  - name: New Tile 321
    title: New Tile 321
    merged_queries:
    - model: system__activity
      explore: group
      type: table
      fields: [user.email, indirect_group.count]
      sorts: [indirect_group.count desc]
      limit: 500
      join_fields: []
    - model: system__activity
      explore: history
      type: table
      fields: [history.query_run_count, user.email]
      limit: 500
      join_fields:
      - field_name: user.email
        source_field_name: user.email
        __FILE: dcl_tiny_dashboard/merge_madness.dashboard.lookml
        __LINE_NUM: 391
    - model: system__activity
      explore: dashboard
      type: table
      fields: [filtered_history_dashboards.dashboards_used_last_30, user.email]
      sorts: [user.email]
      limit: 141
      join_fields:
      - field_name: user.email
        source_field_name: user.email
        __FILE: dcl_tiny_dashboard/merge_madness.dashboard.lookml
        __LINE_NUM: 400
    - model: system__activity
      explore: event
      type: table
      fields: [user.email, event.count]
      sorts: [event.count desc]
      limit: 656
      join_fields:
      - field_name: user.email
        source_field_name: user.email
        __FILE: dcl_tiny_dashboard/merge_madness.dashboard.lookml
        __LINE_NUM: 409
    - model: system__activity
      explore: space
      type: table
      fields: [user.email, space.count]
      sorts: [space.count desc]
      limit: 353
      join_fields:
      - field_name: user.email
        source_field_name: user.email
        __FILE: dcl_tiny_dashboard/merge_madness.dashboard.lookml
        __LINE_NUM: 418
    type: table
    column_limit: 50
    row: 18
    col: 16
    width: 8
    height: 6
  - name: New Tile 654
    title: New Tile 654
    merged_queries:
    - model: system__activity
      explore: group
      type: table
      fields: [user.email, indirect_group.count]
      sorts: [indirect_group.count desc]
      limit: 226
      join_fields: []
    - model: system__activity
      explore: history
      type: table
      fields: [history.query_run_count, user.email]
      limit: 690
      join_fields:
      - field_name: user.email
        source_field_name: user.email
        __FILE: dcl_tiny_dashboard/merge_madness.dashboard.lookml
        __LINE_NUM: 440
    - model: system__activity
      explore: dashboard
      type: table
      fields: [filtered_history_dashboards.dashboards_used_last_30, user.email]
      sorts: [user.email]
      limit: 577
      join_fields:
      - field_name: user.email
        source_field_name: user.email
        __FILE: dcl_tiny_dashboard/merge_madness.dashboard.lookml
        __LINE_NUM: 449
    - model: system__activity
      explore: event
      type: table
      fields: [user.email, event.count]
      sorts: [event.count desc]
      limit: 512
      join_fields:
      - field_name: user.email
        source_field_name: user.email
        __FILE: dcl_tiny_dashboard/merge_madness.dashboard.lookml
        __LINE_NUM: 458
    - model: system__activity
      explore: space
      type: table
      fields: [user.email, space.count]
      sorts: [space.count desc]
      limit: 999
      join_fields:
      - field_name: user.email
        source_field_name: user.email
        __FILE: dcl_tiny_dashboard/merge_madness.dashboard.lookml
        __LINE_NUM: 467
    type: table
    column_limit: 50
    row: 24
    col: 0
    width: 8
    height: 6
  - name: New Tile 987
    title: New Tile 987
    merged_queries:
    - model: system__activity
      explore: group
      type: table
      fields: [user.email, indirect_group.count]
      sorts: [indirect_group.count desc]
      limit: 887
      join_fields: []
    - model: system__activity
      explore: history
      type: table
      fields: [history.query_run_count, user.email]
      limit: 115
      join_fields:
      - field_name: user.email
        source_field_name: user.email
        __FILE: dcl_tiny_dashboard/merge_madness.dashboard.lookml
        __LINE_NUM: 489
    - model: system__activity
      explore: dashboard
      type: table
      fields: [filtered_history_dashboards.dashboards_used_last_30, user.email]
      sorts: [user.email]
      limit: 109
      join_fields:
      - field_name: user.email
        source_field_name: user.email
        __FILE: dcl_tiny_dashboard/merge_madness.dashboard.lookml
        __LINE_NUM: 498
    - model: system__activity
      explore: event
      type: table
      fields: [user.email, event.count]
      sorts: [event.count desc]
      limit: 667
      join_fields:
      - field_name: user.email
        source_field_name: user.email
        __FILE: dcl_tiny_dashboard/merge_madness.dashboard.lookml
        __LINE_NUM: 507
    - model: system__activity
      explore: space
      type: table
      fields: [user.email, space.count]
      sorts: [space.count desc]
      limit: 886
      join_fields:
      - field_name: user.email
        source_field_name: user.email
        __FILE: dcl_tiny_dashboard/merge_madness.dashboard.lookml
        __LINE_NUM: 516
    type: table
    column_limit: 50
    row: 24
    col: 8
    width: 8
    height: 6
  - name: New Tile 10
    title: New Tile 10
    merged_queries:
    - model: system__activity
      explore: group
      type: table
      fields: [user.email, indirect_group.count]
      sorts: [indirect_group.count desc]
      limit: 435
      join_fields: []
    - model: system__activity
      explore: history
      type: table
      fields: [history.query_run_count, user.email]
      limit: 233
      join_fields:
      - field_name: user.email
        source_field_name: user.email
        __FILE: dcl_tiny_dashboard/merge_madness.dashboard.lookml
        __LINE_NUM: 538
    - model: system__activity
      explore: dashboard
      type: table
      fields: [filtered_history_dashboards.dashboards_used_last_30, user.email]
      sorts: [user.email]
      limit: 756
      join_fields:
      - field_name: user.email
        source_field_name: user.email
        __FILE: dcl_tiny_dashboard/merge_madness.dashboard.lookml
        __LINE_NUM: 547
    - model: system__activity
      explore: event
      type: table
      fields: [user.email, event.count]
      sorts: [event.count desc]
      limit: 116
      join_fields:
      - field_name: user.email
        source_field_name: user.email
        __FILE: dcl_tiny_dashboard/merge_madness.dashboard.lookml
        __LINE_NUM: 556
    - model: system__activity
      explore: space
      type: table
      fields: [user.email, space.count]
      sorts: [space.count desc]
      limit: 997
      join_fields:
      - field_name: user.email
        source_field_name: user.email
        __FILE: dcl_tiny_dashboard/merge_madness.dashboard.lookml
        __LINE_NUM: 565
    type: table
    column_limit: 50
    row: 24
    col: 16
    width: 8
    height: 6
  - name: New Tile 11
    title: New Tile 11
    merged_queries:
    - model: system__activity
      explore: group
      type: table
      fields: [user.email, indirect_group.count]
      sorts: [indirect_group.count desc]
      limit: 435
      join_fields: []
    - model: system__activity
      explore: history
      type: table
      fields: [history.query_run_count, user.email]
      limit: 2335
      join_fields:
      - field_name: user.email
        source_field_name: user.email
        __FILE: dcl_tiny_dashboard/merge_madness.dashboard.lookml
        __LINE_NUM: 5385
    - model: system__activity
      explore: dashboard
      type: table
      fields: [filtered_history_dashboards.dashboards_used_last_30, user.email]
      sorts: [user.email]
      limit: 4567
      join_fields:
      - field_name: user.email
        source_field_name: user.email
        __FILE: dcl_tiny_dashboard/merge_madness.dashboard.lookml
        __LINE_NUM: 547
    - model: system__activity
      explore: event
      type: table
      fields: [user.email, event.count]
      sorts: [event.count desc]
      limit: 5000
      join_fields:
      - field_name: user.email
        source_field_name: user.email
        __FILE: dcl_tiny_dashboard/merge_madness.dashboard.lookml
        __LINE_NUM: 556
    - model: system__activity
      explore: space
      type: table
      fields: [user.email, space.count]
      sorts: [space.count desc]
      limit: 987
      join_fields:
      - field_name: user.email
        source_field_name: user.email
        __FILE: dcl_tiny_dashboard/merge_madness.dashboard.lookml
        __LINE_NUM: 565
    type: table
    column_limit: 50
    row: 24
    col: 16
    width: 8
    height: 6
  - name: Tile 1 5 queries 3
    title: Tile 1 5 queries
    merged_queries:
    - model: david_c_ecom
      explore: order_items
      type: table
      fields: [users.id, users.gender]
      sorts: [users.id]
      limit: 4999
      query_timezone: America/Los_Angeles
    - model: david_c_ecom
      explore: order_items
      type: table
      fields: [users.id, users.first_name]
      sorts: [users.id]
      limit: 4999
      query_timezone: America/Los_Angeles
      join_fields:
      - field_name: users.id
        source_field_name: users.id
    - model: david_c_ecom
      explore: order_items
      type: table
      fields: [users.id, users.last_name]
      sorts: [users.id]
      limit: 4999
      query_timezone: America/Los_Angeles
      join_fields:
      - field_name: users.id
        source_field_name: users.id
    - model: david_c_ecom
      explore: order_items
      type: table
      fields: [users.id, users.email, users.age]
      sorts: [users.id]
      limit: 4999
      query_timezone: America/Los_Angeles
      join_fields:
      - field_name: users.id
        source_field_name: users.id
    - model: david_c_ecom
      explore: order_items
      type: table
      fields: [users.id, users.id_with_link, users.age_tier]
      sorts: [users.id]
      limit: 4999
      query_timezone: America/Los_Angeles
      join_fields:
      - field_name: users.id
        source_field_name: users.id
    type: table
    row: 0
    col: 0
    width: 13
    height: 6
  - name: Tile 1 5 queries 4
    title: Tile 1 5 queries
    merged_queries:
    - model: david_c_ecom
      explore: order_items
      type: table
      fields: [users.id, users.gender]
      sorts: [users.id]
      limit: 4888
      query_timezone: America/Los_Angeles
    - model: david_c_ecom
      explore: order_items
      type: table
      fields: [users.id, users.first_name]
      sorts: [users.id]
      limit: 4888
      query_timezone: America/Los_Angeles
      join_fields:
      - field_name: users.id
        source_field_name: users.id
    - model: david_c_ecom
      explore: order_items
      type: table
      fields: [users.id, users.last_name]
      sorts: [users.id]
      limit: 4888
      query_timezone: America/Los_Angeles
      join_fields:
      - field_name: users.id
        source_field_name: users.id
    - model: david_c_ecom
      explore: order_items
      type: table
      fields: [users.id, users.email, users.age]
      sorts: [users.id]
      limit: 4888
      query_timezone: America/Los_Angeles
      join_fields:
      - field_name: users.id
        source_field_name: users.id
    - model: david_c_ecom
      explore: order_items
      type: table
      fields: [users.id, users.id_with_link, users.age_tier]
      sorts: [users.id]
      limit: 4888
      query_timezone: America/Los_Angeles
      join_fields:
      - field_name: users.id
        source_field_name: users.id
    type: table
    row: 0
    col: 0
    width: 13
    height: 6

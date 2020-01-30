- dashboard: repro_dx_2583
  title: repro_DX_2583
  layout: newspaper
  elements:
  - name: 'foo'
    type: text
    title_text: ''
    body_text: <font color="#7e64e0" size="5"><center><b>FOO</b></center></font>
    row: 0
    col: 0
    width: 24
    height: 3
  - name: 'bar'
    type: text
    title_text: ''
    body_text: <font color="#7e64e0" size="5"><center><b>BAR</b></center></font>
    row: 3
    col: 0
    width: 24
    height: 3
  - title: New Tile
    name: New Tile
    model: david_c_ecom
    explore: orders
    type: table
    fields: [users.count]
    limit: 500
    row: 6
    col: 0
    width: 24
    height: 5

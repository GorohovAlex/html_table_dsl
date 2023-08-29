require_relative './lib/html/col'
require_relative './lib/html/head_col'
require_relative './lib/html/row'
require_relative './lib/html/table'

html_table = Html.table(1, 2) #, name: 'table_name', class: 'table_class')
# html_table.attributes = { class: 'table_class_new', name: nil, style: 'border: 1px' }

# head_cols = [Html::HeadCol.new('Text')]
# head_row = Html::Row.new(head_cols, name: 'row_name', class: 'row_class')
# html_table.write_header(head_row)
# cols = Array.new(3) { |index| Html::Col.new("COL #{index} VALUE", style: 'border: 1px solid black') }
# first_row = Html::Row.new(cols, name: 'row_name', class: 'row_class', style: 'background-color: red;')
# second_row = Html::Row.new(cols, name: 'row_name', class: 'row_class', style: 'background-color: green;')

# html_table.write_row(0, first_row)
# html_table.write_row(1, second_row)

cols = [Html::Col.new('Text', name: 'col_name', style: 'col_style')]
html_table.write_row(0, Html::Row.new(cols, name: 'row_name', class: 'row_class'))

puts html_table

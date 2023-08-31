# HTML-table DSL
DLS for working with HTML tables. Easy creation and population of tables in Ruby.

## Install gem
```
gem install html_table_dsl
```
## Use gem
```
require 'html/table'
```
## Create table
```ruby
html_table = Html.table(1, 2, name: 'table_name', class: 'table_class')
# <table name='table_name' class='table_class'><tbody><tr><td></td><td></td></tr></tbody></table>
```
## Change attributes
```ruby
html_table.attributes = { class: 'table_class_new', name: nil, style: 'border: 1px' }
# <table class='table_class_new' style='border: 1px'> ... </table>
```
## Set headers
```ruby
head_cols = [Html::HeadCol.new('Text')]
head_rows = [Html::Row.new(head_cols, name: 'row_name', class: 'row_class')]
html_table.write_header(head_rows)
# <table><thead><tr name='row_name' class='row_class'><th>Text</th></tr></thead><tbody> ... </tbody></table>
```
## Set rows
```ruby
cols = [Html::Col.new('Text', name: 'col_name', style: 'col_style')]
html_table.write_row(0, Html::Row.new(cols, name: 'row_name', class: 'row_class'))
# <table><tbody><tr name='row_name' class='row_class'><td name='col_name' style='col_style'>Text</td></tr></tbody></table>
```

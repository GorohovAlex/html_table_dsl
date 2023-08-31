require './lib/html/col'
require './lib/html/table'
require './lib/html/head_col'

describe Html::Table do
  let(:table) { Html.table(2, 2) }

  it 'generates a simple 2x2 table' do
    expect(table.to_s).to eq('<table><tbody><tr><td> </td><td> </td></tr><tr><td> </td><td> </td></tr></tbody></table>')
    expect(table.to_s.scan('<td>').count).to eq(4)
  end

  context 'with adding data after creating table' do
    let(:cols) { [Html::Col.new('Name')] }
    let(:row) { Html::Row.new(cols, name: 'row_name', class: 'row_class') }

    before { table.write_row(0, row) }

    it 'show added row' do
      expect(table.to_s).to eq(
        '<table>' \
        "<tbody><tr name='row_name' class='row_class'><td>Name</td></tr><tr><td> </td><td> </td></tr></tbody>" \
        '</table>'
      )
    end
  end

  context 'with headers' do
    let(:head_cols) { [Html::HeadCol.new('Name')] }
    let(:header_rows) { [Html::Row.new(head_cols, name: 'row_name', class: 'row_class')] }

    before { table.write_header(header_rows) }

    it 'supports headers' do
      expect(table.to_s).to eq(
        '<table><thead>' \
        "<tr name='row_name' class='row_class'><th>Name</th></tr></thead><tbody><tr><td> </td><td> </td></tr><tr>" \
        '<td> </td><td> </td></tr></tbody></table>'
      )
    end
  end

  context 'with attributes' do
    before { table.attributes = { width: '100px', height: '100px', border: '1' } }

    it 'supports custom width, height, and border' do
      expect(table.to_s).to include("width='100px'")
        .and include("height='100px'")
        .and include("border='1'")
    end
  end

  context 'when full filled' do
    let(:head_cols) { [Html::HeadCol.new('th_value')] }
    let(:header_rows) { [Html::Row.new(head_cols, name: 'row_name', class: 'row_class')] }
    let(:cols) { [Html::Col.new('td_value')] }
    let(:row) { Html::Row.new(cols, name: 'row_name', class: 'row_class') }

    before do
      table.write_header(header_rows)
      table.write_row(0, row)
    end

    it 'shows table with head and body' do
      expect(table.to_s).to eq(
        "<table><thead><tr name='row_name' class='row_class'><th>th_value</th></tr></thead>" \
        "<tbody><tr name='row_name' class='row_class'><td>td_value</td></tr><tr><td> </td><td> </td></tr></tbody>" \
        '</table>'
      )
    end
  end
end

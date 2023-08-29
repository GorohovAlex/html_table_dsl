require './lib/html/thead'
require './lib/html/col'
require './lib/html/row'

describe Html::Thead do
  let(:attrs) { {} }
  let(:row) { nil }
  let(:col) { described_class.new(row, **attrs) }

  it 'return empty thead element' do
    expect(col.to_s).to eq('<thead></thead>')
  end

  context 'with rows' do
    let(:cols) { [Html::Col.new('Text')] }
    let(:row) { Html::Row.new(cols) }

    it 'thead element with value' do
      expect(col.to_s).to eq('<thead><tr><td>Text</td></tr></thead>')
    end
  end

  context 'with attributes' do
    let(:attrs) { { color: 'red', 'background-color' => 'gray' } }

    it 'return thead element with attributes' do
      expect(col.to_s).to eq("<thead color='red' background-color='gray'></thead>")
    end
  end
end

require './lib/html/tbody'
require './lib/html/col'
require './lib/html/row'

describe Html::Tbody do
  let(:attrs) { {} }
  let(:rows) { nil }
  let(:col) { described_class.new(rows, **attrs) }

  it 'return empty tbody element' do
    expect(col.to_s).to eq('<tbody></tbody>')
  end

  context 'with rows' do
    let(:cols) { [Html::Col.new('Text')] }
    let(:rows) { [Html::Row.new(cols)] }

    it 'tbody element with value' do
      expect(col.to_s).to eq('<tbody><tr><td>Text</td></tr></tbody>')
    end
  end

  context 'with attributes' do
    let(:attrs) { { color: 'red', 'background-color' => 'gray' } }

    it 'return tbody element with attributes' do
      expect(col.to_s).to eq("<tbody color='red' background-color='gray'></tbody>")
    end
  end
end

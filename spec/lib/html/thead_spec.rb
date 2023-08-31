require './lib/html/thead'
require './lib/html/col'
require './lib/html/row'

describe Html::Thead do
  let(:attrs) { {} }
  let(:rows) { nil }
  let(:col) { described_class.new(rows, **attrs) }

  it 'return empty thead element' do
    expect(col.to_s).to eq('<thead></thead>')
  end

  context 'with rows' do
    let(:cols) { [Html::Col.new('Text')] }
    let(:rows) { [Html::Row.new(cols)] }

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

  context 'when rows is invalid' do
    let(:rows) { [1] }
    let(:allowed_classes) { 'Html::Row' }
    let(:expected_message) { "The child must be an Html class on of: #{allowed_classes}" }

    it { expect { col.to_s }.to raise_error(ChildFormatError, expected_message) }
  end
end

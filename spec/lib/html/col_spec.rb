require './lib/html/col'

describe Html::Col do
  let(:attrs) { {} }
  let(:value) { nil }
  let(:col) { described_class.new(value, **attrs) }

  it 'return empty td element' do
    expect(col.to_s).to eq('<td></td>')
  end

  context 'with value' do
    let(:value) { 'Text' }

    it 'td element with value' do
      expect(col.to_s).to eq('<td>Text</td>')
    end
  end

  context 'with attributes' do
    let(:attrs) { { color: 'red', 'background-color' => 'gray' } }

    it 'return td element with attributes' do
      expect(col.to_s).to eq("<td color='red' background-color='gray'></td>")
    end
  end
end

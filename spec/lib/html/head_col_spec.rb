require './lib/html/head_col'

describe Html::HeadCol do
  let(:attrs) { {} }
  let(:value) { nil }
  let(:col) { described_class.new(value, **attrs) }

  it 'return empty th element' do
    expect(col.to_s).to eq('<th></th>')
  end

  context 'with value' do
    let(:value) { 'Text' }

    it 'th element with value' do
      expect(col.to_s).to eq('<th>Text</th>')
    end
  end

  context 'with attributes' do
    let(:attrs) { { color: 'red', 'background-color' => 'gray' } }

    it 'return th element with attributes' do
      expect(col.to_s).to eq("<th color='red' background-color='gray'></th>")
    end
  end
end

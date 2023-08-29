require './lib/html/row'

describe Html::Row do
  let(:attrs) { {} }
  let(:cols) { nil }
  let(:col) { described_class.new(cols, **attrs) }

  it 'return empty td element' do
    expect(col.to_s).to eq('<tr></tr>')
  end

  context 'with cols' do
    let(:cols) { [Html::Col.new('Text')] }

    it 'row element with value' do
      expect(col.to_s).to eq('<tr><td>Text</td></tr>')
    end
  end

  context 'with attributes' do
    let(:attrs) { { color: 'red', 'background-color' => 'gray' } }

    it 'return row element with attributes' do
      expect(col.to_s).to eq("<tr color='red' background-color='gray'></tr>")
    end
  end
end

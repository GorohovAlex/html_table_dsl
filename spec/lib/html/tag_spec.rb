require './lib/html/tag'

describe Html::Tag do
  let(:attrs) { {} }
  let(:tag) { described_class.new(**attrs) }

  it { expect { tag.to_s }.to raise_error(NotImplementedError) }

  context 'with attributes' do
    let(:attrs) { { color: 'red', 'background-color' => 'gray' } }

    it { expect { tag.to_s }.to raise_error(NotImplementedError) }
  end
end

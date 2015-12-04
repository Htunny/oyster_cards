require "journey"

describe Journey do
  let(:card)    { double :card  }
  let(:station) { double :station }
  penalty_fine = described_class::PENALTY_FINE


  it 'card instantiates new journey' do
    expect(subject.log).to eq(Hash.new)
  end


  # it 'penalize user with two consecutive touch_ins' do
  #   allow(card).to receive(:touch_in).with(station)
  #   card.touch_in(station)
  #   expect{ subject.touch_in(station) }.to change{ card.balance }.by -20
  # end
  #
  # it 'charges customer if they touch out without touching in' do
  #   expect{ card.touch_out(station) }.to change{ card.balance }.by -penalty_fine + fare
  # end
end

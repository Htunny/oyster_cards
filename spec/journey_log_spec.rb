require 'journey_log'

describe Journey_log do

  let(:journey) { double :journey }

subject(:journey_log) {described_class.new(:journey_klass)}
  it {is_expected.to respond_to(:start_journey)}
  it {is_expected.to respond_to(:exit_journey)}

  # it {is_expected.to respond_to(:exit_journey)}
 it 'should return incomplete journey' do
   expect(journey).not_to be_nil
 end

context 'no journey has been undertaken'do
   it 'returns list of all previous trips' do
     expect(journey_log.history).to be_empty
   end

 end
end

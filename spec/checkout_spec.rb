require 'checkout'
describe Checkout do
  let(:checkout) {Checkout.new}

  it 'nothing added to total if nothing scanned' do
    expect(checkout.total).to eq(0)
  end

  it 'adds item scanned to the total' do
    checkout.scan(Item.new('A', 50))
    expect(checkout.total).to eq(50)
  end

end

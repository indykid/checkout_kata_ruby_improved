require 'checkout'
describe Checkout do
  it 'nothing added to total if nothing scanned' do
    checkout = Checkout.new
    expect(checkout.total).to eq(0)
  end

  it 'adds items scanned to the total' do
    checkout = Checkout.new
    checkout.scan(Item.new('A', 50))
    expect(checkout.total).to eq(50)
  end
end

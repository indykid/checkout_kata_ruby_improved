require 'checkout'
describe Checkout do
  let(:checkout) {Checkout.new({
                        'A' => {quantity: 3, amount: 20},
                        'B' => {quantity: 2, amount: 15}
                               })}

  it 'nothing scanned' do
    expect(checkout.total).to eq(0)
  end

  it 'adds item scanned to the total' do
    checkout.scan(Item.new('A', 50))
    expect(checkout.total).to eq(50)
  end

  
  it 'discount not applicable' do
    checkout.scan(Item.new('A', 50))
    checkout.scan(Item.new('A', 50))
    expect(checkout.total).to eq(100)
  end

  it 'discount is applicable' do
    checkout.scan(Item.new('A', 50))
    checkout.scan(Item.new('A', 50))
    checkout.scan(Item.new('A', 50))
    expect(checkout.total).to eq(130)
  end

  it 'multiple discounts applicable' do
    checkout.scan(Item.new('A', 50))
    checkout.scan(Item.new('A', 50))
    checkout.scan(Item.new('A', 50))
    checkout.scan(Item.new('B', 30))
    checkout.scan(Item.new('B', 30))
    expect(checkout.total).to eq(175)
  end
end

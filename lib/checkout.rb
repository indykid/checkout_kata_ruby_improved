class Checkout
  def initialize
    @items = []
  end
  
  def total
    @items.reduce(0) { |total, item| total + item.price }
  end

  def scan(item)
    @items << item
  end
end

Item = Struct.new(:barcode, :price)

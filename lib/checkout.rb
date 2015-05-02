Item = Struct.new(:barcode, :price)

class Checkout

  def initialize(promotions={})
    @items = []
    @promotions = promotions
  end

  def total
    subtotal - discount
  end

  def scan(item)
    @items << item
  end

  private
  
  def subtotal
    @items.reduce(0) { |total, item| total + item.price }
  end

  def discount
    tally.keys.reduce(0) do |discount, barcode|
      discount + discount_per(barcode)
    end
  end

  def tally
    @items.reduce({}) do |memo, item|
      memo[item.barcode] = memo.fetch(item.barcode, 0) + 1
      memo
    end
  end

  def discount_per(barcode)
     discount_multiplier(barcode) * discount_amount(barcode)
  end

  def discount_multiplier(barcode)
    (item_quantity(barcode) / discount_quantity(barcode)).floor
  end

  def discount_amount(barcode)
    @promotions[barcode][:amount]
  end

  def discount_quantity(barcode)
    @promotions[barcode][:quantity]
  end

  def item_quantity(barcode)
    tally[barcode]
  end
end



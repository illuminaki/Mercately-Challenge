class Cart
  attr_reader :items

  def initialize(items = [])
    @items = items
  end

  def add_product(product_id)
    unless @items.include?(product_id)
      @items << product_id
      true
    else
      false
    end
  end

  def remove_product(product_id)
    @items.delete(product_id)
  end

  def clear
    @items = []
  end

  def empty?
    @items.empty?
  end

  def total_items
    @items.size
  end
end

class Product
  def initialize(title,quantity,price)
    @title = title
    @quantity = quantity
    @price = price

  end

  def what_price
    return "Цена на товар #{@title} - #{@price} руб."
  end
end
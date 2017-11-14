class Product
  def initialize(quantity, price) #поставим в качестве параметров инициализации значения которые есть у всех суб-классов -
    @amount_available = quantity #а имеенно - Количество и цена
    @price = price
  end

  def price
    @price
  end

  def update

  end

  def info

  end

  def display
  "#{info} - #{price} руб. [осталось: #{@amount_available}]"
  end
end
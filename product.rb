class Product
  def self.catalog(array) #статический метод, который показывает весь ассортимент
    for item in array do
      if item.class == "String"
        puts item
      else
        puts item.display
      end
    end
  end

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
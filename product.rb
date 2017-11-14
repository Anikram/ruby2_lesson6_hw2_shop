class Product
  def self.catalog(array) #статический метод, который показывает весь ассортимент
    number = 1
    puts "\n ---------------------\n Ассортимент товара: \n ---------------------\n"
    for item in array do
      puts "#{number}. #{item.display}"
      number += 1
    end
    puts "----------------------\n"
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
   return "#{info} - #{price} руб. [осталось: #{@amount_available}]"
  end


end
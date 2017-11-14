class Product
  def self.catalog(array) #статический метод, который показывает весь ассортимент

    puts "\n ---------------------\n Ассортимент товара: \n ---------------------\n"
    array.each_with_index do |product, index|
      puts "#{index+1}. #{product.display}"

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

  def amount
    @amount_available
  end

  def change_amount(i)
    @amount_available -= i
  end
  def info

  end

  def display
    return "#{info} - #{price} руб. [осталось: #{@amount_available}]"
  end

  def self.buy(catalog)
    puts 'Какой товар вы хотите приобрести?'

    flag = 0 # флаг условия выхода из безконечно цикла запроса ввода

    while flag == 0 do
      puts "Введите номер товара:"
      user_input = STDIN.gets.to_i-1 # получение номера товара (c компенсацией сдвига массива - каталог)

      if catalog[user_input]
        flag = 1

        if catalog[user_input].amount >= 0
          $the_bank = $the_bank + catalog[user_input].price.to_i #считаем выручку

          catalog[user_input].change_amount(1) #изменяем количество товара на складе

          puts "Поздравляем с приобретением:\n #{catalog[user_input].info}" #Поздравления и остаток склада _ банк

          puts "В кассе магазина #{$the_bank} рублей."

          puts "На складе осталось товара: #{catalog[user_input].amount}."

        else
          puts "К сожалению товар закончился"
        end
      else
        puts "Такого товара нет на складе."
      end
    end
  end

end
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
puts catalog[user_input].amount
        if catalog[user_input].amount.to_i >= 0
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

  def self.read_from_xml(file_name)

    unless File.exist?(file_name)
      abort("File #{file_name} не найден")
    end


    file = File.new(file_name)
    doc = REXML::Document.new(file)
    file.close

    result =[]

    doc.elements.each("catalog/films/film") do |item|
      doc_amount = item.attributes["amount"].to_i
      doc_price = item.attributes["price"].to_i

      film = Film.new(doc_amount, doc_price)
      film.update(title: item.attributes["title"], director_name: item.attributes["director"], year: item.attributes["year"])
      result.push(film)
    end
    doc.elements.each("catalog/books/book") do |item|
      doc_amount = item.attributes["amount"].to_i
      doc_price = item.attributes["price"].to_i

      book = Book.new(doc_amount, doc_price)
      book.update(title: item.attributes["title"], director_name: item.attributes["author_name"])
      result.push(book)
    end
    doc.elements.each("catalog/albums/album") do |item|
      doc_amount = item.attributes["amount"].to_i
      doc_price = item.attributes["price"].to_i

      album = Film.new(doc_amount, doc_price)
      album.update(title: item.attributes["title"], director_name: item.attributes["artist_name"], year: item.attributes["genre"])
      result.push(album)
    end

    return result

  end
end

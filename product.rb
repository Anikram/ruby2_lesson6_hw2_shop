class Product
  def initialize(title, quantity, price)
    @title = title
    @quantity = quantity
    @price = price
  end

  def what_price
    return "Цена на товар #{@title} - #{@price} руб."
  end

  def update_info

  end

  def get_full_info
    puts "---------------------\n\n"
    if self.class == Film
      puts "Название фильма: " + @title
      puts "Режиссер: " + @director
      puts "Дата премьеры: " + @premiere
    elsif self.class == Book
      puts "Название книги: " + @title
      puts "Автор: " + @author
      #puts "Дата премьеры: " + @premiere
    elsif self.class == Album
      puts "Название Альбома: " + @title
      puts "Автор песен: " + @song_writer
      puts "Стиль музыки: " + @music_style
    end
  end

  def display

  end
end
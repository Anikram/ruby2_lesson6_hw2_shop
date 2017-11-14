#encoding: utf-8
class Album < Product
  def initialize(title, quantity, price)
    super

  end

  def update_info
    puts "Введите новое Название альбома, Автора и стиль музыки:"

    count = 0
    array = []

    while count <=3 do
      user_input = STDIN.gets.encode("UTF-8").chomp.to_s

      array << user_input
      count += 1
    end

    @title = array[0]
    @song_writer = array[1]
    @music_style = array[2]
  end
  def display
    return "Название фильма: #{@title}, Автор. #{@song_writer} (стиль - #{@music_style}) - #{@price} [кол. #{@quantity},шт.]"
  end
end
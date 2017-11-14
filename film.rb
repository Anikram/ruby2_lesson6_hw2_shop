#encoding: utf-8
class Film < Product
  def initialize(title,quantity,price)
    super
    #@director = ""
   # @premiere = ""
  end

  def update_info
    puts "Введите новое Название фильма, Режиссера и дату премьеры:"

    count = 1
    array = []

    while count <=3 do
      user_input = STDIN.gets.encode("UTF-8").chomp.to_s

      array << user_input

      count += 1
    end

    @title = array[0]
    @director = array[1]
    @premiere = array[2]
  end

  def display
    return "Название фильма: #{@title}, Реж. #{@director} (#{@premiere}) - #{@price} [кол. #{@quantity},шт.]"
  end
end
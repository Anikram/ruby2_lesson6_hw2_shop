#encoding: utf-8

class Book < Product
  def initialize(title, quantity, price)
    super

  end

  def update_info
    puts "Введите новое Название книги и Автора:"

    count = 0
    array = []

    while count <=2 do
      user_input = STDIN.gets.encode("UTF-8").chomp.to_s

      array << user_input
      count += 1
    end

    @title = array[0]
    @author = array[1]
  end
end
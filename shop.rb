#encoding: utf-8
# Программа - Онлайн Магазн
# version: 0.7
# by Anikram
#git config core.autocrlf true - cure Unix - Windows ending of files trouble
#####

if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end #заплатка для работы русского шрифта в Windows

require_relative "product.rb" # Подключаем классы
require_relative "book.rb"
require_relative "film.rb"
require_relative "album.rb"
require "rexml/document"
#require 'date'

current_path = File.dirname(__FILE__)
file_name = current_path + "/data/base.xml"

$the_bank = 0

catalog = Product.read_from_xml(file_name)

user_input = nil
while user_input != "x" do
  Product.catalog(catalog)
  puts "Хотите что-то купить? (Y/N)"
  user_input = STDIN.gets.downcase.chomp
  if user_input == "y"

    Product.buy(catalog)
  else
    puts "Хотите выйти?(Y/N)"
    user_input = STDIN.gets.downcase.chomp
    if user_input == "y"
      break
    end
  end
end
puts "С вас #{$the_bank} рублей."
puts "Спасибо, что воспользовались нашими услугами!"





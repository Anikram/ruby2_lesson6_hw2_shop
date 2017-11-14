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

films = [] # МАССИВЫ для хранения товаров
albums = []
books = []
$the_bank = 0

films[0] = Film.new(23, 299) #загружаем несколько фильмов в базу
films[0].update(:title => 'Леон', :director_name => 'Люк Бессон', :year => '1994')
films[1] = Film.new(2, 799)
films[1].update(:title => 'Пираты карибского моря', :director_name => 'Коффин', :year => '2001')
films[2] = Film.new(5, 499)
films[2].update(:title => 'Джумаджи', :director_name => 'Роберт Земекис', :year => '1996')
albums[0] = Album.new(10, 1200)
albums[0].update(:album_name => 'Yellow brick wall', :artist_name => 'Beatles', :genre => 'Psychodelic rock')
books[0] = Book.new(13, 699)
books[0].update(:title => "Том Сойер", :author_name => "Чарльз Диккенс")

catalog = []

#catalog << "\n ---------------------\n Ассортимент товара:"
#catalog << "\n ---------------------\n Каталог фильмов: "
catalog = catalog + films
#catalog << "\n ---------------------\n Каталог Книг: "
catalog = catalog + books
#catalog << "\n ---------------------\n Каталог Музыки: "
catalog += albums

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





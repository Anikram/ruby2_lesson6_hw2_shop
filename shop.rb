#encoding: utf-8
#git config core.autocrlf true - cure Unix - Windows ending of files trouble

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

films = []
albums = []
books = []

films[0] = Film.new("Эпоха динозавров", 23, 299) #загружаем несколько фильмов в базу
films[1] = Film.new("Леон", 2, 799)
films[2] = Film.new("Джумаджи", 5, 499)
albums[0] = Album.new("Yellow brick wall", 10, 1200)

#films << film

#puts films[0].what_price

films[0].update_info

#puts films[0].what_price

#films[0].get_full_info

puts "\n ---------------------\n\t Каталог фильмов: "
for film in films do
    puts film.display
end
puts "\n ---------------------\n\t Каталог Книг: "
for book in books do
  puts book.display
end
puts "\n ---------------------\n\t Каталог Музыки: "
for album in albums do
  puts album.display
end



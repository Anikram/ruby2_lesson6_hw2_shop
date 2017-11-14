#encoding: utf-8

if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end #заплатка для работы русского шрифта в Windows

require_relative "product.rb"
require_relative "book.rb"
require_relative "film.rb"
require_relative "album.rb"

films = []

film = Film.new("Эпоха динозавров", 2, 299)

films << film

puts films[0].what_price

films[0].update_info

puts films[0].what_price

films[0].get_full_info



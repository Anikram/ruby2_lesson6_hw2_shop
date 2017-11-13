require_relative "product.rb"
require_relative "book.rb"
require_relative "film.rb"
require_relative "album.rb"

films = []

film = Film.new("Эпоха динозавров", 2, 299)

films << film

puts films[0].what_price


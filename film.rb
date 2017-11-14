#encoding: utf-8
class Film < Product
  def update(options) #для ввода данных в класс используется update
    # инициализация даже не повторяется. Не всегда нужно в инициализации перечислять все параметры
    @title = options[:title]
    @director_name = options[:director_name]
    @year = options[:year]
  end

  def info
  "Фильм \"#{@title}\", реж. #{@director_name} (#{@year})"
  end

  def display
    return "Название фильма: \"#{@title}\", реж. #{@director_name} (#{@year})"
  # в родительском классе уже указан вывод цены и коллчества - тут не повторяется
  end
end
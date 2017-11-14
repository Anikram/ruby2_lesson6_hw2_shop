#encoding: utf-8

class Book < Product
  def update(options)
    @title = options[:title]
    @author_name = options[:author_name]
  end

  def info
    return "Название Книги: \"#{@title}\", Автор #{@author_name} " # цена и количество в родительском классе
  end
end
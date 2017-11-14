#encoding: utf-8
class Album < Product

  def update(options)
    @album_name = options[:album_name]
    @artist_name = options[:artist_name]
    @genre = options[:genre]
  end
  def info
    return "Название Альбома: #{@album_name} -  #{@artist_name} (стиль - #{@genre})"
  end
end
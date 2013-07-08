class LibraryParser

  def self.get_files(dir_name)
    Dir["#{dir_name}/*.mp3"]
  end

  def self.parse_mp3(filename, dir_name)
    artist_name = filename.split("#{dir_name}/").last.split(" - ").first
    song_name   = filename.split(" - ").last.split(" [").first
    genre_name  = filename.split(" - ").last.split(" [").last.split("].").first
    {song_name: song_name, artist_name: artist_name, genre_name: genre_name}
  end


  # def initialize(dir_name = '.')
  #   @dir_name = dir_name
  # end

  # def call
  #   artist_list ||= []
  #   song_list   ||= []
  #   genre_list  ||= []

  #   @files = Dir["#{@dir_name}/*.mp3"]

  #   @files.each do |filename|
  #     # Parse mp3 filenames
  #     song_info = self.class.parse_mp3(filename, @dir_name)

  #     # Instantiate new artist, song, and genre if they don't exist
  #     artist = add_object_to_class(Artist, song_info[:artist_name], artist_list)
  #     song   = add_object_to_class(Song,   song_info[:song_name],   song_list)
  #     genre  = add_object_to_class(Genre,  song_info[:genre_name],  genre_list)

  #     # Assign relationships
  #     song.genre  = genre
  #     song.artist = artist
  #     # artist.add_song(song)
  #   end

  #   {song_list: song_list, artist_list: artist_list, genre_list: genre_list}
  # end


  # # Either instantiate a new object of class "klass" & name "name"
  # #   or find an object with that "name" if it already exists in the "list"
  # def add_object_to_class(klass, name, list = [])
  #   if list.include? name
  #     return klass.all.select{|element| element.name == name}.first
  #   else
  #     list << name
  #     return klass.new(name)
  #   end
  # end

end


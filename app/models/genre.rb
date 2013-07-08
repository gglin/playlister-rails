class Genre < ActiveRecord::Base
  has_many :songs
  has_many :artists, :through => :songs
  attr_accessible :name

  def print(width = nil, *args)
    song_word   = self.songs_count   == 1 ? "Song" : "Songs"
    artist_word = self.artists_count == 1 ? "Artist" : "Artists"
    "#{spacer(self.name+':',width)} #{self.artists_count} #{artist_word}, #{self.songs_count} #{song_word}"
  end
end

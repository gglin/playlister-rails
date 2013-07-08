class Artist < ActiveRecord::Base
  has_many :songs, dependent: :destroy
  has_many :genres, :through => :songs
  attr_accessible :name

  def print(width = nil, *args)
    song_word = self.songs_count == 1 ? "Song" : "Songs"
    "#{spacer(self.name,width)} - #{self.songs_count} #{song_word}"
  end
end

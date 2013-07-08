class Genre < ActiveRecord::Base
  has_many :songs
  has_many :artists, :through => :songs
  attr_accessible :name

  validates_uniqueness_of :name, :case_sensitive => false
  validates :name, :presence => true 

  extend  Sluggable::ClassMethods
  include Sluggable::InstanceMethods

  extend  Prettifiable::ClassMethods
  include Prettifiable::InstanceMethods

  def print(width = nil, *args)
    song_word   = self.songs.size   == 1 ? "Song" : "Songs"
    artist_word = self.artists.size == 1 ? "Artist" : "Artists"
    "#{spacer(self.name+':',width)} #{spacer(self.artists.size.to_s + ' ' + artist_word + ', ' + self.songs.size.to_s + ' ' + song_word, 21)}"
  end
end

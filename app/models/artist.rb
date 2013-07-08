class Artist < ActiveRecord::Base
  has_many :songs, dependent: :destroy
  has_many :genres, :through => :songs
  attr_accessible :name

  validates_uniqueness_of :name, :case_sensitive => false
  validates :name, :presence => true 

  extend  Sluggable::ClassMethods
  include Sluggable::InstanceMethods

  extend  Prettifiable::ClassMethods
  include Prettifiable::InstanceMethods

  def print(width = nil, *args)
    song_word = self.songs.size == 1 ? "Song" : "Songs"
    "#{spacer(self.name,width)} - #{self.songs.size} #{spacer(song_word,6)}"
  end
end

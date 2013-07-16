class Genre < ActiveRecord::Base
  has_many :songs
  has_many :artists, :through => :songs
  has_many :albums,  :through => :songs
  
  attr_accessible :name

  validates_uniqueness_of :name, :case_sensitive => false
  validates :name, :presence => true 

  extend  Sluggable::ClassMethods
  include Sluggable::InstanceMethods

  extend  Prettifiable::ClassMethods
  include Prettifiable::InstanceMethods

  include ActionView::Helpers::TextHelper

  def print(width = nil, include_artists = false, include_albums = false, include_songs = false)
    artists_comma = (include_albums || include_songs)  ? ',' : ''
    artists_word  = include_artists ? spacer(pluralize(self.artists.uniq.size, 'Artist')+artists_comma, 11) : ""

    albums_comma  = include_songs   ? ',' : ''
    albums_word   = include_albums  ? spacer(pluralize(self.albums.uniq.size, 'Album')+albums_comma, 10) : ""

    songs_word    = include_songs   ? spacer(pluralize(self.songs.uniq.size, 'Song'))             : ""

    "#{spacer(self.name, width)}   - #{artists_word} #{albums_word} #{songs_word}"
  end
end

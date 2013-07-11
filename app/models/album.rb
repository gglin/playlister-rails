class Album < ActiveRecord::Base
  has_many   :songs
  has_many   :genres, :through => :songs
  belongs_to :artist
  attr_accessible :name, :artist_id

  validates :name, :presence => true 

  extend  Sluggable::ClassMethods
  include Sluggable::InstanceMethods

  extend  Prettifiable::ClassMethods
  include Prettifiable::InstanceMethods

  include ActionView::Helpers::TextHelper

  def print(width = nil, include_artist = false, artist_width = nil, include_songs = false)
    artist_word = include_artist ? "#{spacer(self.artist.name, artist_width)} - "       : ""
    songs_word  = include_songs  ? "(#{spacer(pluralize(self.songs.size, 'Song'), 8)})" : ""
    artist_word + "#{spacer(self.name, width)}" + songs_word
  end

  def self.table_title(max_artist, max_album)
    "#{spacer("Artist", max_artist)}  #{spacer("Album", max_album)}"
  end

  def primary_genre()
    
  end

  def assign_genre_to_all_songs()
    
  end
end

class Album < ActiveRecord::Base
  has_many   :songs,  dependent: :destroy
  has_many   :genres, :through => :songs
  belongs_to :artist
  
  attr_accessible :name, :artist_id

  validates :name, :artist_id, :presence => true 

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
    return nil if self.songs.empty?
    genres_sorted.first
  end

  def genres_sorted()
    genres_freq = Hash.new(0)
    self.songs.each do |song|
      genres_freq[song.genre] += 1
    end
    genres_freq = Hash[*genres_freq.sort_by{|k,v| v}.reverse.flatten]
    genres_freq.keys
  end

  def assign_genre_to_all_songs()
    
  end
end

class Song < ActiveRecord::Base
  has_many :playlists_songs
  has_many :playlists, :through => :playlists_songs

  belongs_to :artist
  belongs_to :genre
  belongs_to :album

  attr_accessible :name, :track
  attr_accessible :artist_id, :genre_id, :album_id, :playlist_ids

  validates :name, :artist_id, :presence => true

  extend  Sluggable::ClassMethods
  include Sluggable::InstanceMethods

  extend  Prettifiable::ClassMethods
  include Prettifiable::InstanceMethods

  def full_name
    "#{artist.name} - #{name}"
  end

  def full_name_with_genre
    if genre
      "#{full_name} [#{genre.name}]"
    else
      full_name
    end
  end

  def print(width = nil, include_artist = false, artist_width = nil, include_genre = true)
    artist_word = include_artist ? "#{spacer(self.artist.name, artist_width)} - " : ""
    genre_word  = include_genre  ? "[#{self.genre.name}]" : ""
    artist_word + "#{spacer(self.name, width)}" + genre_word
  end

  def youtube
    id = YoutubeSearch.search("#{self.artist.name} #{self.name}").first["video_id"]
  end
end

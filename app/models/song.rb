class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  belongs_to :album
  attr_accessible :name
  attr_protected :artist_id, :genre_id, :album_id

  validates :name, :artist_id, :genre_id, :presence => true 

  extend  Sluggable::ClassMethods
  include Sluggable::InstanceMethods

  extend  Prettifiable::ClassMethods
  include Prettifiable::InstanceMethods

  def print(width = nil, include_artist = false, artist_width = nil, include_genre = true)
    artist_word = include_artist ? "#{spacer(self.artist.name,artist_width)} - " : ""
    genre_word  = include_genre  ? "[#{self.genre.name}]" : ""
    artist_word + "#{spacer(self.name,width)}" + genre_word
  end

  def print_with_links(width = nil, include_artist = false, artist_width = nil, include_genre = true)
    artist_word = include_artist ? "<a href=\"/artists/#{self.artist.to_param}\">#{spacer(self.artist.name, artist_width)}</a> - " : ""
    genre_word  = include_genre  ? "<a href=\"/genres/#{self.genre.to_param}\">[#{self.genre.name}]</a>" : ""
    artist_word + "<a href=\"/songs/#{self.to_param}\">#{spacer(self.name,width)}</a>" + genre_word
  end

  def youtube
    id = YoutubeSearch.search("#{self.artist.name} #{self.name}").first["video_id"]
    # url = "http://www.youtube.com/watch?v=#{id}"
    # ::OEmbed::Providers::Youtube.get(url).html
  end
end

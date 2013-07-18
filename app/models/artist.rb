class Artist < ActiveRecord::Base
  has_many :songs,  dependent: :destroy
  has_many :albums
  has_many :genres, :through => :songs
  
  attr_accessible :name

  validates_uniqueness_of :name, :case_sensitive => false
  validates :name, :presence => true 

  extend  Sluggable::ClassMethods
  include Sluggable::InstanceMethods

  extend  Prettifiable::ClassMethods
  include Prettifiable::InstanceMethods

  include ActionView::Helpers::TextHelper

  def print(width = nil, include_albums = false, include_songs = false)
    comma       = include_songs  ? ',' : ''
    albums_word = include_albums ? spacer(pluralize(self.albums.uniq.size, 'Album')+comma, 10) : ""
    songs_word  = include_songs  ? spacer(pluralize(self.songs.uniq.size, 'Song'))             : ""
    "#{spacer(self.name, width)} - #{albums_word} #{songs_word}"
  end

  def primary_genre()
  end

  def assign_genre_to_all_songs()
  end

  def get_art(size_index = -1)
    artist_info.nil?  ?  nil  :  artist_info["image"][size_index]["content"]
  end

  def artist_info
    apikey    = "4cd656bf335d5baa637bc52590fcb291"
    apisecret = "a35277ca92d08df45e65db32ae806a0a"
    lastfm = Lastfm.new(apikey, apisecret)
    
    all_results = lastfm.artist.search(artist: name, api_key: apikey)["results"]
    return nil if all_results["totalResults"] == "0"

    matches = all_results["artistmatches"]["artist"]
    matches.is_a?(Array)  ?  matches.first  :  matches
  end

  def primary_genre
    return nil if self.songs.empty?
    genres_sorted.first
  end

  def primary_genre_id
    primary_genre.nil?  ?  nil  :  primary_genre.id
  end

  def genres_sorted
    genres_freq = Hash.new(0)
    self.songs.each do |song|
      genres_freq[song.genre] += 1
    end
    genres_freq = Hash[*genres_freq.sort_by{|k,v| v}.reverse.flatten]
    genres_freq.keys
  end
end

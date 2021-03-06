class Webartist
  attr_accessor :name

  extend  Sluggable::ClassMethods
  include Sluggable::InstanceMethods

  extend  Prettifiable::ClassMethods
  include Prettifiable::InstanceMethods

  include ActionView::Helpers::TextHelper

  def initialize(name)
    @name = name
  end

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

  def get_art()
    artist_info["image"][-1]["content"]
  end

  def artist_info
    apikey    = "4cd656bf335d5baa637bc52590fcb291"
    apisecret = "a35277ca92d08df45e65db32ae806a0a"
    lastfm = Lastfm.new(apikey, apisecret)

    all_results = lastfm.artist.search(artist: name, api_key: apikey)["results"]["artistmatches"]["artist"]
    all_results.is_a?(Array)  ?  all_results.first  :  all_results
  end


  def self.top_artists
    apikey    = "4cd656bf335d5baa637bc52590fcb291"
    apisecret = "a35277ca92d08df45e65db32ae806a0a"
    lastfm = Lastfm.new(apikey, apisecret)

    all_results = lastfm.chart.get_top_artists(limit: 100).collect {|artist| artist["name"]}
  end

  def self.top_artists_tracks(artist_name)
    apikey    = "4cd656bf335d5baa637bc52590fcb291"
    apisecret = "a35277ca92d08df45e65db32ae806a0a"
    lastfm = Lastfm.new(apikey, apisecret)

    all_results = lastfm.artist.get_top_tracks(artist: "#{artist_name}", api_key: apikey).collect {|artist| artist["name"]}
  end

end

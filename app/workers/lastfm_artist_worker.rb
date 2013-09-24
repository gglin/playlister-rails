class LastfmArtistWorker
  include Sidekiq::Worker

  def perform(artist_id)
    artist = Artist.find(artist_id)
    artist.image_url = get_art(artist.name, -2)
    artist.save
  end

  def get_art(artist_name, size_index = -1)
    info = artist_info(artist_name)
    info.nil?  ?  nil  :  info["image"][size_index]["content"]
  end

  def artist_info(artist_name)
    apikey    = "4cd656bf335d5baa637bc52590fcb291"
    apisecret = "a35277ca92d08df45e65db32ae806a0a"
    lastfm = Lastfm.new(apikey, apisecret)

    all_results = lastfm.artist.search(artist: artist_name, api_key: apikey)["results"]
    return nil if all_results["totalResults"] == "0"

    matches = all_results["artistmatches"]["artist"]
    matches.is_a?(Array)  ?  matches.first  :  matches
  end
end
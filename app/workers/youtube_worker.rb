class YoutubeWorker
  include Sidekiq::Worker

  def perform(song)
    id = YoutubeSearch.search("#{song.artist.name} #{song.name}").first["video_id"]
    song.youtube_url = id
  end
end
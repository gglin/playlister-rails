class YoutubeWorker
  include Sidekiq::Worker

  def perform(song_id)
    song = Song.find(song_id)
    id = YoutubeSearch.search("#{song.artist.name} #{song.name}").first["video_id"]
    song.youtube_url = id
    song.save
  end
end
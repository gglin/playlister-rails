class YoutubePlaylistWorker
  include Sidekiq::Worker

  def perform(song_id)
    song = Song.find(song_id)
    id = YoutubeSearch.search("#{song.artist.name} #{song.name}").first["video_id"]
    @youtube_ids[song_id] = id
  end
end
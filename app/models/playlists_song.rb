class PlaylistsSong < ActiveRecord::Base
  belongs_to :playlist
  belongs_to :song

  attr_accessible :playlist_id, :song_id
  validates       :playlist_id, :song_id, :presence => true 
end

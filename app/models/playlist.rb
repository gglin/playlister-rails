class Playlist < ActiveRecord::Base
  has_many :playlists_songs
  has_many :songs,   :through => :playlists_songs

  has_many :artists, :through => :songs
  has_many :albums,  :through => :songs
  has_many :genres,  :through => :songs

  attr_accessible :name
  attr_accessible :song_ids

  validates_uniqueness_of :name, :case_sensitive => false
  validates :name, :presence => true

  extend  Sluggable::ClassMethods
  include Sluggable::InstanceMethods

  extend  Prettifiable::ClassMethods
  include Prettifiable::InstanceMethods

  #  SQLite3 may not be ideal for this - can't handle concurrent connections
  def update_async
    songs.each do |song|
      unless song.youtube_url
        YoutubeWorker.perform_async(song.id)
      end
    end
  end

end

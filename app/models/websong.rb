class Websong 

  extend  Sluggable::ClassMethods
  include Sluggable::InstanceMethods

  extend  Prettifiable::ClassMethods
  include Prettifiable::InstanceMethods

  def parse_url
  	parsed = request.fullpath.split('/')[2]
  end

  def self.youtube(artist_name, song_name)
    id = YoutubeSearch.search("#{artist_name} #{song_name}").first["video_id"]
  end

end

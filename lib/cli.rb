Dir.glob('./assets/*').each do |file|
  require file
end

Dir.glob('../app/models/*').each do |file|
  require file
end


# Parse the data folder and create a new local variable which holds all the songs
parser = LibraryParser.new
parser.call('data')

songs = Song.all


# start a jukebox CLI
cli = Jukebox.new
cli.add_songs(songs)
cli.start
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require "#{Rails.root}/lib/library_parser.rb"

data_folder = File.expand_path('../data', __FILE__)

Artist.delete_all
Genre.delete_all
Song.delete_all
Album.delete_all

LibraryParser.get_files(data_folder).each do |filename|
  song_info = LibraryParser.parse_mp3(filename, data_folder)
  p song_info
  artist = Artist.find_or_create_by_name(song_info[:artist_name])
  genre  =  Genre.find_or_create_by_name(song_info[:genre_name])
  song   =   Song.find_or_create_by_name(song_info[:song_name])
  song.update_attributes(:artist => artist, :genre => genre)
end
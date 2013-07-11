class AddTrackToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :track, :integer
  end
end

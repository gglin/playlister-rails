class Album < ActiveRecord::Base
  has_many   :songs
  belongs_to :artist
  attr_accessible :name, :artist_id

  validates :name, :presence => true 
end

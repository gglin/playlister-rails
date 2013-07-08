class Artist < ActiveRecord::Base
  has_many :songs, dependent: :destroy
  has_many :genres, :through => :songs
  attr_accessible :name
end

class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  attr_accessible :name
end

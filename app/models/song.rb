class Song < ActiveRecord::Base
  belongs_to :category
  
  validates :title, presence: true
  validates :artist, presence: true
end

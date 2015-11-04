class Category < ActiveRecord::Base
  has_many :songs
  
  validates :subject, presence: true

end

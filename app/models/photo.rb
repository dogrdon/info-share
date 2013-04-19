class Photo < ActiveRecord::Base
  Photo.belongs_to(:user)
  Photo.has_many(:comments, {:as => :commentable})
  
  Photo.has_attached_file(:photo)

  
  validates_presence_of :photo_file_name
  validates_uniqueness_of :photo_file_name
end

class Video < ActiveRecord::Base
  Video.belongs_to(:user)
  Video.has_many(:comments, {:as => :commentable})
 
  Video.has_attached_file(:video)
 
  validates_presence_of :video_file_name
  validates_uniqueness_of :video_file_name

  
end

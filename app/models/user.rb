class User < ActiveRecord::Base
  acts_as_authentic
  has_attached_file :avatar, :styles  => { :thumb => "100x100#", :small => "150x150>" } 
  User.has_many(:videos)
  User.has_many(:photos)
  User.has_many(:comments)
  
  # validates_attachment_presence :avatar  
  # validates_attachment_size :avatar, :less_than => 5.megabytes  
  # validates_attachment_content_type :avatar, :content_type => ['image/jpeg', 'image/png']
end

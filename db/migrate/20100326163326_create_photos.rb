class CreatePhotos < ActiveRecord::Migration
  def self.up
    create_table :photos do |t|
      t.string(:photo)
      t.string(:photo_title)
      t.string(:photo_description)
      t.belongs_to(:user)
      t.timestamps
    end
  end

  def self.down
    drop_table :photos
  end
end

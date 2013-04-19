class CreateAvatars < ActiveRecord::Migration
  def self.up
    create_table :avatars do |t|
      t.string(:photo)
      t.string(:title)
      t.string(:description)
      t.belongs_to(:user)
      t.timestamps
    end
  end

  def self.down
    drop_table :avatars
  end
end

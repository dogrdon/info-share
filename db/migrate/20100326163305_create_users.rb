class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string(:username)
      t.string(:email)
      t.string(:location)
      t.string(:crypted_password)
      t.string(:password_salt)
      t.text(:bio)
      t.string(:persistence_token)
      #login count? IP? see README
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end

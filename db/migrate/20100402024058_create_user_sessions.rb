class CreateUserSessions < ActiveRecord::Migration
  def self.up
    create_table :user_sessions do |t|
      t.string :user_session, :null => false
      t.text :data

      t.timestamps
    end
  end

  def self.down
    drop_table :user_sessions
  end
end

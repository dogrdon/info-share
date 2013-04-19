class CreateSiteRoots < ActiveRecord::Migration
  def self.up
    create_table :site_roots do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :site_roots
  end
end

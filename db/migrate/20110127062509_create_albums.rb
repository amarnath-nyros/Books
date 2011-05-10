class CreateAlbums < ActiveRecord::Migration
  def self.up
    create_table :albums do |t|

      t.timestamps
    end


  def self.down
    drop_table :albums
  end
end

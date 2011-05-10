class CreateAlbumPhotos < ActiveRecord::Migration
  def self.up
    create_table :album_photos do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :album_photos
  end
end

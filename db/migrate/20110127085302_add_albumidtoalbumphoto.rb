class AddAlbumidtoalbumphoto < ActiveRecord::Migration
  def self.up
    add_column :album_photos,:album_id , :string
  end

  def self.down
  end
end

class Addphoto < ActiveRecord::Migration
  def self.up
    add_column :album_photos, :bphoto_file_name, :string
    add_column :album_photos, :bphoto_content_type, :string
    add_column :album_photos, :bphoto_file_size, :integer
  end

  def self.down
  end
end

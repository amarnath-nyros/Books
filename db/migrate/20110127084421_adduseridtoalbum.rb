class Adduseridtoalbum < ActiveRecord::Migration
  def self.up
    
      add_column :albums,:user_id , :string
    add_column :albums,:album_photo_id , :string
  end

  def self.down
  end
end

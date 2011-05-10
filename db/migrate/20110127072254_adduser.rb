class Adduser < ActiveRecord::Migration
  def self.up
    
         add_column :users,:name , :string
         add_column :users,:password , :string
         add_column :users,:conpass , :string
           add_column :users,:email , :string
          add_column :users, :photo_file_name, :string
    add_column :users, :photo_content_type, :string
    add_column :users, :photo_file_size, :integer
         
    
    
    
    
    
  end

  def self.down
  end
end

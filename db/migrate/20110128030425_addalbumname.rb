class Addalbumname < ActiveRecord::Migration
  def self.up
    
     add_column :albums,:albumname , :string
    add_column :albums,:albumlocation , :string
    add_column :albums, :aphoto_file_name, :string
    add_column :albums, :aphoto_content_type, :string
    add_column :albums, :aphoto_file_size, :integer
         
    
    
    
  end

  def self.down
  end
end

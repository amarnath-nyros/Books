class Addstoryname < ActiveRecord::Migration
  def self.up
    
    
     add_column :stories,:storyname , :string
    add_column :stories,:storydescription , :string
   
  end

  def self.down
  end
end

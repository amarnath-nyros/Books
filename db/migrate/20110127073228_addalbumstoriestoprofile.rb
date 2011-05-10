class Addalbumstoriestoprofile < ActiveRecord::Migration
  def self.up
    
    
         add_column :profiles,:album_id , :string
         add_column :profiles,:albumphotos, :string
         add_column :profiles,:stories_id , :string
        
  end

  def self.down
  end
end

class Addidtostories < ActiveRecord::Migration
  def self.up
    
     add_column :stories,:user_id , :string
    
  end

  def self.down
  end
end

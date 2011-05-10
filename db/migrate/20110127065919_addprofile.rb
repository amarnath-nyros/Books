class Addprofile < ActiveRecord::Migration
  def self.up
         
         add_column :profiles,:fname , :string
         add_column :profiles,:lname , :string
         add_column :profiles,:email , :string
         add_column :profiles,:address , :string
         add_column :profiles,:user_id , :string
         
end
       
  def self.down
      end
  
end 


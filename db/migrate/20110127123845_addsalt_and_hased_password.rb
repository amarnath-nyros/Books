class AddsaltAndHasedPassword < ActiveRecord::Migration
  def self.up
    add_column :users,:salt , :string
         add_column :users,:hashed_password , :string
  end

  def self.down
  end
end

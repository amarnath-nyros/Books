class AlbumPhoto < ActiveRecord::Base
  belongs_to:user
  belongs_to:album
   
       validates_attachment_presence :bphoto
       has_attached_file :bphoto,:whiny => false,
    :styles => {
      :thumb=> "100x100#",
      :smalls  => "150x150>",:smallsthumb  => "150x150#" }
  
  
  
  
end

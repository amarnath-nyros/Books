class Album < ActiveRecord::Base
  acts_as_rateable
   belongs_to:user
   has_many:album_photos
   
   
    
    has_attached_file :aphoto,:whiny => false,
    :styles => {
      :thumb=> "100x100#",
      :smalls  => "150x150>",:smallsthumb  => "150x150#" }
  
        validates_presence_of :albumname,:albumlocation
       validates_uniqueness_of    :albumname,:albumlocation
       validates_attachment_presence :aphoto
   
   
     #~ def find_albums_with_feature(album_id)
    #~ albums_for_feature = Albums.find_by_sql(  
    #~ ["select max(ratings) from albums where  
    #~ feature_id])"]
  #~ end
   
   
   
   
   
   
  
   
   
   
      
end

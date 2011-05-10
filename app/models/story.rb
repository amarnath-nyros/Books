class Story < ActiveRecord::Base
  
acts_as_commentable
      acts_as_rateable

belongs_to:user
        validates_presence_of :storyname,:storydescription
       validates_uniqueness_of    :storyname,:storydescription
   
   
end

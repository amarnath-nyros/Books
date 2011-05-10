class Profile < ActiveRecord::Base
    
     belongs_to:user
     
     
     validates_presence_of :fname,:lname,:email,:address,:on=>:create
     #~ validates_uniqueness_of :email,:on=>:create
     validates_format_of :email, :with =>%r{^(?:[_a-z0-9-]+)(\.[_a-z0-9-]+)*@([a-z0-9-]+)(\.[a-zA-Z0-9\-\.]+)*(\.[a-z]{2,4})$}i,:on=>:create
    #~ validates_format_of :fname,:lname,:with =>/^[a-zA-Z]+$/,:on=>:create
     validates_length_of :fname, :lname,:within => 2..20, :too_long => "pick a shorter name", :too_short => "pick a longer name",:on=>:create
  
   
   

end

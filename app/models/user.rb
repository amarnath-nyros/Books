require 'digest/sha1'

class User < ActiveRecord::Base
    has_many :stories
  has_many:albums
  has_one:profile
  #~ has_many:album_photos
 
   validates_presence_of :name,:password,:email,:photo,:on=>:create
     attr_accessor :password_confirmation
   validates_attachment_presence :photo,:message => "Missing required Image location"  , :on=>:create
    validates_confirmation_of :password,:on=>:create 
  validates_length_of :name, :within => 2..20, :too_long => "pick a shorter name", :too_short => "pick a longer name",:on=>:create
  validates_length_of :password,:maximum => 12,:on=>:create
  #~ validates_confirmation_of :conpass,:on=>:create
  validates_format_of :email, :with =>%r{^(?:[_a-z0-9-]+)(\.[_a-z0-9-]+)*@([a-z0-9-]+)(\.[a-zA-Z0-9\-\.]+)*(\.[a-z]{2,4})$}i,:on=>:create
  validates_uniqueness_of  :name,:on=>:create





auto_html_for : do
    html_escape
    image
    youtube(:width => 400, :height => 250)
    link :target => "_blank", :rel => "nofollow"
    simple_format
  end
















 
  #~ validates_format_of :name,:with =>/^[a-zA-Z]+$/,:on=>:create
  
#~ validates_attachment_presence :photo,:message => "Missing required Image location"  , :on=>:create
  #~ validates_attachment_content_type :photo, :content_type => 'image/jpeg'
      #~ validates_attachment_presence :photo

  
   has_attached_file :photo,:whiny => false,
    :styles => {
      :thumb=> "100x100#",
      :smalls  => "150x150>",:smallsthumb  => "150x150#" }
    def password 
          @password
          end

      def password=(password) 
          @password = password 
          return if password.blank? 
          create_new_salt 
          self.hashed_password = User.encrypted_password(self.password, self.salt)
      end
 
        def self.authenticate(name, password)
          user =User.find_by_name(name)
          if user
          expected_password = encrypted_password(password, user.salt)
          if user.hashed_password != expected_password
          user = nil
       end
   end
user
end
     

 def send_new_password
    new_pass = User.random_string(5)
    self.password = self.password_confirmation = new_pass
    self.save
    Sendmail.deliver_passwordforgot(self.email, self.name, new_pass,self.id)
  end

        def create_new_salt 
            self.salt = self.object_id.to_s + rand.to_s
        end

          def self.encrypted_password(password, salt) 
            string_to_hash = password+"wibble"+salt  
            Digest::SHA1.hexdigest(string_to_hash)
          end 

 
 def  mailpassword
    newpassword = User.random_string(6)
    self.password = self.password_confirmation = newpassword
    self.save
    Notifications.deliver_forgot_password(self.email, self.name, newpassword,self.id)
  end
  
  private
        def password_non_blank 
            errors.add(:password,"Missing password")if hashed_password.blank?
        end


def self.random_string(len)
    #generat a random password consisting of strings and digits
    chars = ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a 
    newpass = ""
    1.upto(len) { |i| newpass << chars[rand(chars.size-1)] }
    return newpass
  end


end
  
  
  
  
  
  
  
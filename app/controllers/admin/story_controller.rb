class Admin::StoryController < ApplicationController
  
  
  def new
    @user=User.new 
    @profile=Profile.new
 #~ @album=Album.new
      end


 def create
   #~ render :text => params.inspect and return
      @user=User.new(params[:user]) 
        @profile=Profile.new(params[:profile]) 
    if @user.save
         @profile.user_id=@user.id
          if @profile.save
           session[:user_id]=@user.id
            redirect_to :action=>"show"  
            else 
          render :action=>"new"     
         end
          else 
          render :action=>"new"        
        end
        #~ sendmymail(:email)
    end
  
    
    #~ def sendmymail(email)
    #~ if session[:user_id].blank?
    #~ if request.post?
      #~ u= User.find_by_email(params[:user][:email])
      #~ if u and u.send_new_password
        #~ flash[:notice]  = "A new password has been sent by email."
        #~ redirect_to :action=>'forgot_password'
      #~ else
        #~ flash[:notice]  = "Couldn't send password"
      #~ end
    #~ end
    #~ else
      #~ redirect_to :action => 'logme' and return
    #~ end
  #~ end
    
  #~ def edit
        #~ if session[:user_id]
       #~ @profile=Profile.find(:first ,:conditions =>[ "user_id = ?" ,session[:user_id]] )
       #~ @user=@profile.user
       #~ @story=@user.stories
       #~ else     #~ @user=Suser.find(session[:user_id])
      #
       #~ flash[:notice]="Please Login for this page. "
       #~ redirect_to :action=>"index"   
       #~ end
       #~ end
    
    
  def edit
 #~ if checked_in?(params[:id])
    if @story = Story.find(params[:id])
     else 
        flash[:notice]="Please Login for this page. "
   redirect_to :controller => "user",:action=>"adminlist"   
   end
  #~ end
    end
  
  
    
    
        
    def  storylist
     #~ @user   =User.find(:all)
    @stories=Story.find(:all)
     #~ @album=Album.find(:all)
#~ @albums = Album.paginate :page =>params[:page] , :per_page => 5 
 #~ @users=User.paginate :page=>params[:page] ,:per_page=>5      
    #~ @user=User.new
    #~ @users=@profiles.user
 #~ if session[:user_id]
   #~ @user=User.find(session[:user_id])
      #~ @books=@user.sbookks
      #~ flash[:notice]=""
       #~ else 
      #~ flash[:notice]="Please Login for this page. "
       #~ redirect_to :action=>"index"   
       #~ end
end
    
    def update

   @story = Story.find(params[:id])
      if @story.update_attributes(params[:story])
         #~ render :text => "hi" and return
   flash[:notice]="Success fully  Story details updated."
      redirect_to :controller=>"user",:action=>"adminlist" ,:id =>@story.user_id
      end
  end
    
    
    def show
           @story=Story.find(params[:id])     
        end


  
 def index
  
#~ render :text => params[:user].inspect and return
if request.post?
#~ @user = User.find(:first ,:conditions => ["name = ? and password = ?",params[:user][:name], params[:user][:password]]) 
     @user = User.authenticate(params[:name],params[:password])
if   !@user.blank?
          session[:user_id]=@user.id
          session[:user_name]=@user.name
          #~ test session[:password]=@user.password
        redirect_to :action=>"show"
         else 
           #~ flash.now[:error] = "Could not save client"
            flash[:notice]="Password and Username not match."
             render :action=>"index" and return      
             end
           end  
           end


      def logout
       #reset_session
    session[:user_id]=nil   if  session[:user_id]
    session[:user_name]=nil  if  session[:user_name]
     flash[:notice]="You Are  LogedOut Success fully."
     render :action=>"index"        
    end

def userlist
  @profiles=Profile.find(:all)
 #~ @profiles=@users.profiles
end
  
  
  def changepassword
      @user=User.find(session[:user_id])
    if request.post?
    @user.update_attributes(:password=>params[:user][:password], 
      :password_confirmation => params[:user][:password_confirmation])
      if @user.save
        flash[:notice]="Password Changed"
      redirect_to :action=>'show'
      else 
        redirect_to :action=>'error'
        end
    end
  end


def forgot_password
  if session[:user_id].blank?
   
      #~ @user=User.new 
    #~ @profile=Profile.new
    if request.post?
      u= User.find_by_email(params[:user][:email])
      if u and u.send_new_password
        flash[:notice]  = "A new password has been sent by email."
        redirect_to :action=>'forgot_password'
      else
        flash[:notice]  = "Couldn't send password"
      end
    end
    else
      redirect_to :action => 'index' and return
      end
  end

def save_new_password
  @user = User.find(params[:id])
  @user.password = params[:value]
  @user.update_attributes(params[:user])
  redirect_to :action => 'index' and return
end





    def mystories
      if session[:user_id]
      @user=User.find(session[:user_id])     
     @storys =@user.stories    
     @stories =@user.stories.paginate :page =>params[:page] , :per_page => 5     
        
      else 
         flash[:notice23]="Please Login for this page. "
       render :action=>"index"        
      end
   end












  def delete
        if  @story = Story.find(params[:id])
     #render :text => "hi" and return
     @story.destroy
 flash[:notice]="Success fully deleted book ."      
 redirect_to :controller=>'user', :action => 'adminlist',:id =>params[:val]
 #~ redirect_to :controller=>"album",:action=>"show" ,:id =>@album_photo.album_id
   # redirect_to :controller=>'user', :action => 'adminlist'
   end
  end
end

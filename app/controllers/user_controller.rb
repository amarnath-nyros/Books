class UserController < ApplicationController
   
   
  def new
    
    @user=User.new 
    @profile=Profile.new
 #~ @album=Album.new
      end


 def create
   # render :text => params[:user].inspect and return
   
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
        
    end
  
  
  def login
    
    
    end
    

    
  def edit
    
        if session[:user_id]
       @profile=Profile.find(:first ,:conditions =>[ "user_id = ?" ,session[:user_id]] )
       @user=@profile.user
       else     
       flash[:notice]="Please Login for this page. "
       redirect_to :action=>"index"   
       end
       end
    
        
    def list
     @user   =User.find(:all)
     @profile=Profile.find(:all)
     @album=Album.find(:all)

end
    
      def update
  #~ render :text => "hi" and return
    @user = User.find(params[:id])
    @profile=@user.profile
    @user.update_attributes!(params[:user])       
     if @profile.update_attributes(params[:profile])
            flash[:notice]="Success fully  user details updated."
            redirect_to :controller=>"user",:action=>"show" ,:id =>@user.id
      end
    end

    
    
    
    def show
      if session[:user_id]
          flash[:notice]=nil
      @user=User.find(session[:user_id])     
      @profile=@user.profile   
     @albums =@user.albums    
     @storys =@user.stories    
      else 
         flash[:notice23]="Please Login for this page. "
       render :action=>"index"        
      end
   end


  
 def index
 #~ render :text =>request.request_uri and return
if request.post?
     @user = User.authenticate(params[:name],params[:password])
if   !@user.blank?
          session[:user_id]=@user.id
          session[:user_name]=@user.name
          #~ test session[:password]=@user.password
          redirect_back_or_default(:action=>"show")
       # redirect_to :action=>"show"
         else 
           #~ flash.now[:error] = "Could not save client"
            flash[:notice]="Invalid user/password combination"
             render :controller=>"user",:action=>"index"
             end
           end  
end

      def logout

   #~ reset_session
    session[:user_id]=nil   if  session[:user_id]
    session[:user_name]=nil  if  session[:user_name]
     session[:return_to] =nil
     flash[:notice]="You Are  LogedOut Success fully."
     render :action=>"index"        
    end

  
def userlist
  @profiles=Profile.find(:all)
 #~ @profiles=@users.profiles
end
  
  
  def changepassword
  
if request.post?
     # render :text => "hi" and return
     @opwd=params[:oldpassword]
    @user=User.authenticate(session[:user_name],params[:oldpassword])
           #render :text =>"#{params[:oldpassword]} ,#{session[:user_name]} ,#{@user.name} " and return  
          if   !@user.blank?
               if  @user.update_attributes(:password=>params[:user][:password], 
                :password_confirmation => params[:user][:password_confirmation])
                 redirect_to :action=>"show"
                 flash[:show]="Your Password Has been changed."
                 else
                    flash[:notice]="Two Passwords not match try again ."
                    render :action=>"changepassword" and return      
                  end
         else 
            flash[:notice]=" Old Password not match try again ."
             render :action=>"changepassword" and return      
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
        flash[:notice3]  = "Couldn't send password"
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

  def delete
    if request.post?
    user = User.find(params[:id])
    user.destroy
    end
    redirect_to(:action => :home)
 
  end

end

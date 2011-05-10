class Admin::UserController < ApplicationController
  
  
  def new
    @user=User.new 
    @profile=Profile.new
      end


 def create
   #~ render :text => params.inspect and return
      @user=User.new(params[:user]) 
        @profile=Profile.new(params[:profile]) 
    if @user.save
         @profile.user_id=@user.id
          if @profile.save
           session[:user_id]=@user.id
            redirect_to :action=>"userlist"  
            else 
          render :action=>"new"     
         end
          else 
          render :action=>"new"        
        end
        end
  
    
  def edit
        if session[:user_id]
       @profile=Profile.find(:first ,:conditions =>[ "user_id = ?" ,session[:user_id]] )
       @user=@profile.user
       else  
      #~ @books=@user.books
       flash[:notice]="Please Login for this page. "
       redirect_to :action=>"index"   
       end
       end
    
        
    def list
     @user   =User.find(:all)
     @album=Album.find(:all)
    end
    
      def update
  #  render :text => "hi" and return
    @user = User.find(params[:id])
    @profile=@user.profile
    @user.update_attributes(params[:user])       
     if @profile.update_attributes(params[:profile])
   flash[:notice]="Success fully  user details updated."
      redirect_to :controller=>"user",:action=>"show" ,:id =>@user.id
      end
    end
    
    
    def show
     @user=User.find(session[:user_id])
      @profile=@user.profile #find(session[:user_id])    
     @albums =@user.albums    
     @storys =@user.stories    
   end

    def adminlist
      @user=User.find(params[:id])     
      @albums =@user.albums.paginate :page =>params[:page] , :per_page => 5 
        @stories =@user.stories.paginate :page =>params[:page] , :per_page => 5     
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
        redirect_to :action=>"userlist"
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
     flash[:notice12]="You Are  LogedOut Success fully."
     render :action=>"index"        
    end

def userlist
 @users = User.paginate :page =>params[:page] , :per_page => 5
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



def save_new_password
  @user = User.find(params[:id])
  @user.password = params[:value]
  @user.update_attributes(params[:user])
  redirect_to :action => 'index' and return
end


 def search
  @val1=params[:user][:name]
    @val2=params[:user][:email]
    if !@val1.blank? || !@val2.blank?  
   @users=User.paginate :page=>params[:page],:conditions => ["name like ? and email like ? " ,params[:user][:name]+"%", params[:user][:email]+"%"],:per_page=>5 
     render :action=>"userlist"     
     else 
 #~ @users=User.find(:all ,:conditions => ["name like ? and email like ? " ,"%"+params[:user][:name]+"%", "%"+params[:user][:email]+"%"]) 
     flash[:notice] ="Please Dont Leave Empty"
     redirect_to  :action=>"userlist"   
  end
   end
   
  def delete
        #~ render :text => "hi" and return
    user = User.find(params[:id])
    user.destroy
    flash[:notice25]="User has been Successfully deleted"   
    redirect_to(:action => :userlist)
            
        
  end
  
end

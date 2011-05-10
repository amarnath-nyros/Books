class StoryController < ApplicationController
     before_filter :checked_in?, :only =>[:edit,:delete]
  
   def index
   end
    
  
  def new
    @story=Story.new
    end
  
  def create
    
  end
  
    
  def update
    #~ render :text => "hi" and return
   @story = Story.find(params[:id])
      if @story.update_attributes(params[:story])
  
 
   flash[:notice1]="Success fully  Story details updated."
      redirect_to :controller=>"story",:action=>"show" ,:id =>@story.id
      end
  end
  
  #~ def rate
#~ u = Story.find(session[:user_id])
#~ b = Story.find(params[:id])
#~ b.rate params[:val], u 
#~ @storys=Story.find(:all)
#~ render  :action=>"show"
  #~ end
  
  def edit
   #~ if checked_in?(params[:id])
    #~ if @story = Story.find(params[:id])
    #~ else 
    #~ flash[:notice]="Please Login for this page. "
   #~ redirect_to :controller => "user",:action=>"error"   
   #~ end
  #~ end
    end
  
  

 def delete
 if @story.destroy
 flash[:notice2]="Your Story has been Successfully deleted ."      
   redirect_to :controller=>'story',:action => 'mystories'
 
   end
  end
   
  

  def addstory
       #~ render :text=>"hi" and return
            
     @story = Story.new
     @story = Story.new(params[:story])
     @story.user_id=session[:user_id]
      if request.post?
      if  @story.save
        flash[:message] = "STORY SUCCESFULLY SAVED "
    #~ redirect_to:action=>'addstory', :id =>   story.id
    @s="RECORD SUCCESFULLY CREATED AND SAVED"
    @storys=Story.find(:all)
      redirect_to :controller=>'story',:action => 'mystories'
         
      flash[:error] = "PLEASE FII THE PAGE AS INSTRUCTED "
      
      end
      end
     end
   
   
 def checked_in?()
     @story=Story.find(:first,:conditions => ["user_id = ? and id = ? ",session[:user_id],params[:id]]) 
    #s render :text =>@story.inspect and return
     if   !@story.blank?
       return true
     else
     redirect_to :controller => "user",:action=>"error"   
    end
    end
    
  def show
    
     if session[:user_id]
         @story=Story.find(params[:id])
               else
     redirect_to :controller => "user",:action=>"index"   
    end

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
  
  
  
  def post
   
model = Story.find(params[:id])
comment = Comment.new
comment.comment = params[:comment]
 #~ comment.comment = 'Some comment'
 redirect_to :controller=>'story',:action => 'mystories',:id => params[:id]
 #~ :id => session[:user_id]
 model.comments << comment
end 
  
  
  
end

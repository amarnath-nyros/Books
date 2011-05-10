class Admin::AlbumController < ApplicationController
   #~ before_filter :checked_in?, :only =>[:show,:edit,:delete]
  
  def new
@album=Album.new
  end
       
  def create 
      @album = Album.new(params[:album])
      @album.user_id=session[:user_id]
   if  @album.save
        flash[:message] = "album SUCCESFULLY SAVED "
      @album=Album.find(:last)
  #~ @s="RECORD SUCCESFULLY CREATED AND SAVED"
    redirect_to:action=>'list'
   else 
      render:action=>'new'
      #~ flash[:error] = "PLEASE FII THE PAGE AS INSTRUCTED "
      #~ redirect_to :action => 'list',:id=>@album.id
      end
         end
    
    
    def list
     #~ @users=@profiles.user
      if session[:user_id]
      @user=User.find(:all)
      @albums=@user.album
      flash[:notice]=""
        else 
       flash[:notice]="Please Login for this page. "
       redirect_to :action=>"index"   
      end
   end
    
    def albumlist
      @albums=Album.find(:all)
      
      end
    
    
  def rate
u = User.find(session[:user_id])
b = Album.find(params[:id])
b.rate params[:val], u 
@albums=Album.find(:all)
render  :action=>"show"
  end
  
  
 def checked_in?()
     @album=Album.find(params[:id]) 
     if   !@album.blank?
       return true
     else
     redirect_to :controller => "user",:action=>"error"   
    end
    end
  
 
  
def show
    
       @album=Album.find(params[:id])
      
      end
  
  
  
  def update
    #~ render :text => "hi" and return
   @album = Album.find(params[:id])
      if @album.update_attributes(params[:album])
   #~ redirect_to :action => 'show',:id=>@book.id
  #~ flash[:notice_item] = "#{@book.items} " 
   flash[:notice]="Success fully  Album details updated."
      redirect_to :controller=>"album",:action=>"show" ,:id =>@album.id
      end
  end
  
  
  
  def edit
 #~ if checked_in?(params[:id])
    if @album = Album.find(params[:id])
     else 
        flash[:notice]="Please Login for this page. "
   redirect_to :controller => "user",:action=>"error"   
   end
  #~ end
    end
  
  

 def delete
 #~ if @album.destroy
 
  if  @album = Album.find(params[:id])
     #render :text => "hi" and return
     @album.destroy
 flash[:notice]="Success fully deleted book ."      
 redirect_to :controller=>'user', :action => 'adminlist',:id =>params[:val]
 #~ redirect_to :controller=>"album",:action=>"show" ,:id =>@album_photo.album_id
   # redirect_to :controller=>'user', :action => 'adminlist'
   end
 end
 
   def addalbum
     @album = Album.new
     if request.post?
     @album = Album.new(params[:album])
     #~ render :text => params[:album] and return
      @album.user_id=session[:user_id]
   if  @album.save
        flash[:message] = "album SUCCESFULLY SAVED "
      @album=Album.find(:last)
       redirect_to:action=>'addphoto', :id =>   @album.id
  #~ @s="RECORD SUCCESFULLY CREATED AND SAVED"
   
      #~ flash[:error] = "PLEASE FII THE PAGE AS INSTRUCTED "
      #~ redirect_to :action => 'list',:id=>@album.id
      end
         end
     end
   
   def addphoto

    @addphoto=AlbumPhoto.new
  
    if request.post?
      # render :text =>  params.inspect  and return
        @addphoto = AlbumPhoto.new(params[:addphoto])
        @addphoto.album_id= params[:id]
     if  @addphoto.save
      flash[:message] = "album SUCCESFULLY SAVED "
        #~ redirect_to :action=>'show', :id =>   @album.id
       #~ redirect_to:action=>'addphoto'
  #~ @s="RECORD SUCCESFULLY CREATED AND SAVED"
         
    end
     end

    end
    
    
    def editphoto
          @album_photo=AlbumPhoto.find(params[:id])
    if request.post?
      @album_photo=AlbumPhoto.find(params[:id])
      if @album_photo.update_attributes(params[:album_photo])
   #~ redirect_to :action => 'show',:id=>@book.id
  #~ flash[:notice_item] = "#{@book.items} " 
   flash[:notice]="Success fully  Album details updated."
      redirect_to :controller=>"album",:action=>"show" ,:id =>@album_photo.album_id
    end
    end
      end
    
    
    def deletephoto
          @album_photo=AlbumPhoto.find(params[:id])
          @album_photo.destroy
           redirect_to :controller=>"album",:action=>"show" ,:id =>@album_photo.album_id
    end
    
     
    def myalbums
    if session[:user_id]
      @user=User.find(session[:user_id])
      # @albums=@user.albums
      @albums =@user.albums.paginate :page =>params[:page] , :per_page => 5 
        
      flash[:notice]=""
        else 
       flash[:notice]="Please Login for this page. "
       redirect_to :action=>"index"   
      end
    end
    
    
     def home

@albums=Album.find_by_sql"Select * from albums where id in (select rateable_id  from ratings where(rateable_type='Album'  and rating>4) order by rating asc)"

 @stories=Story.find_by_sql"Select * from stories where id in (select rateable_id  from ratings where(rateable_type='Story' and rating>4) order by rating asc)"

   end    
    
    
end

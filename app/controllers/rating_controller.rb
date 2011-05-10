class RatingController < ApplicationController
  
  def rate
    #~ render :text => params.inspect and return
  
    @album = Album.find(params[:id])
    Rating.delete_all(["rateable_type = 'Album' AND rateable_id = ? AND user_id = ?", 
    @album.id, session[:user_id]])
    @album.add_rating Rating.new(:rating => params[:rating], :user_id => session[:user_id])    

end


def rate1
    @story = Story.find(params[:id])
    Rating.delete_all(["rateable_type = 'Story' AND rateable_id = ? AND user_id = ?", 
    @story.id, session[:user_id]])
    @story.add_rating Rating.new(:rating => params[:rating], :user_id => session[:user_id])
 
    #~ page.replace_html "star-ratings-block_#{@book.id}", :partial => 'sbook/average', :locals => { :book => @book } 




end
end
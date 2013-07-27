class PhotosController < ApplicationController
  def index
    @photos = Photo.all
  end
 
  def show
    @photo = Photo.find(params[:id])
    respond_to do |format|
    	format.html
   		format.json{render json:@photo}
   	end
  end
  
  def new
    @photo = Photo.new
  end
 
  def create
    @photo = Photo.new(params[:photo])
    @photo.user_id = session[:uid]
    # normal save
    if @photo.save
      redirect_to('/photos/'+@photo.id.to_s, :notice => 'Photo was successfully created.')
    else
      render :action => "new"
    end
  end
  
  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    redirect_to(photos_url)
  end
end

class PhotosController < ApplicationController
  def index
    @photos = Photo.all
  end
 
  def show
    @photo = Photo.find(params[:id])
    @photo[:medium] = @photo.img.url(:medium)
    @photo[:thumbnail] =@photo.img.url(:thumbnail)
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
    	respond_to do |format|
		   format.html{redirect_to('/photos/'+@photo.id.to_s, :notice => 'Photo was successfully created.')}
		   format.json{render json:{'response'=>@photo}}
		end
    else
      render :action => "new"
    end
  end
  def my
  	@uid = params[:uid]
  	@photos = Photo.find(:all, :conditions => [ "user_id = ?", @uid])
  	@photos.each do |photo|
  		photo[:medium] = photo.img.url(:medium)
    	photo[:thumbnail] =photo.img.url(:thumbnail)
  	end
  	render json:@photos
  end

  def city
  	@uid = params[:uid]
  	@city = params[:city]
  	@photos = Photo.find(:all, :conditions => [ "user_id = ? AND city = ?", @uid,@city])
  	@photos.each do |photo|
  		photo[:medium] = photo.img.url(:medium)
    	photo[:thumbnail] =photo.img.url(:thumbnail)
  	end
  	render json:@photos
  end

  def friends
  	@user_id = params[:user_id]
  	render json: @photos
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    redirect_to(photos_url)
  end
end

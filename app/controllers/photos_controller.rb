class PhotosController < ApplicationController
  def index
    @photos = Photo.all
  end
 
  def show
    @photo = Photo.find(params[:id])
    @photo[:medium] = @photo.img.url(:medium)
    @photo[:thumb] =@photo.img.url(:thumb)
    respond_to do |format|
    	format.html
   		format.json{render json:@photo}
   	end
  end
  def edit
    @photo = Photo.find(params[:id])
  end
  def update
    @photo = Photo.find(params[:id])

    respond_to do |format|
      if @photo.update_attributes(params[:photo])
        format.html { redirect_to @photo, notice: 'Photo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end
  def new
    @photo = Photo.new
  end
  def upload
    if(params[:uid]&&params[:lat]&&params[:lng]&&params[:city]&&params[:img]&&params[:province])
       @photo = Photo.new({:uid=> params[:uid],:lat=>params[:lat],:lng=>params[:lng],:img=>params[:img], :province=>params[:province]})
        if @photo.save
            respond_to do|format|
                    format.html{redirect_to('/photos/'+@photo.id.to_s)}
                    format.json{render json:@photo}
            end
        else
          render json:{'response'=>'not saved'}
        end
    else
        render json:{'response'=>'failed'}
    end
  end
  def create
    @photo = Photo.new(params[:photo])
    @photo.user_id = session[:uid]
    # normal save
    if @photo.save
      @photo[:medium] = @photo.img.url(:medium)
      @photo[:thumb] =@photo.img.url(:thumb)
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
    	photo[:thumb] =photo.img.url(:thumb)
  	end
  	render json:@photos
  end

  def cities
    require 'set'
    @uid = params[:uid]
    @cities = [].to_set
    @photos = Photo.find(:all, :conditions => [ "user_id = ?", @uid])
    @photos.each do |photo|
      @cities.add(photo.city)
    end
    render json:@cities
  end

  def city
  	@uid = params[:uid]
  	@city = params[:city]
  	@photos = Photo.find(:all, :conditions => [ "user_id = ? AND city = ?", @uid,@city])
  	@photos.each do |photo|
  		photo[:medium] = photo.img.url(:medium)
    	photo[:thumb] =photo.img.url(:thumb)
  	end
  	render json:@photos
  end
  def provinces
    require 'set'
    @uid = params[:uid]
    @provinces = [].to_set
    @photos = Photo.find(:all, :conditions => [ "user_id = ?", @uid])
    @photos.each do |photo|
      @provinces.add(photo.province)
    end
    render json:@provinces
  end

  def province
    @uid = params[:uid]
    @province = params[:province]
    @photos = Photo.find(:all, :conditions => [ "user_id = ? AND province = ?", @uid,@province])
    @photos.each do |photo|
      photo[:medium] = photo.img.url(:medium)
      photo[:thumb] =photo.img.url(:thumb)
    end
    render json:@photos
  end
  def friends
  	@uid= params[:uid]
  	@friends = Friend.find(:all, :conditions =>["uid1=?",@uid])
  	@photos=[]
  	@friends.each do |friend|
  		@photo = Photo.find(:all,:conditions=>["user_id=?",friend[:uid2]])
  		@photos.concat(@photo)
  	end
  	render json: @photos
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    redirect_to(photos_url)
  end
end

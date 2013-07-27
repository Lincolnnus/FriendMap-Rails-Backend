class FriendsController < ApplicationController
  def index
    @friends = Friend.all
  end
 
  def show
    @friend = Friend.find(params[:id])
    respond_to do |format|
    	format.html
   		format.json{render json:@friend}
   	end
  end
  
  def new
    @friend = Friend.new
  end
  def edit
    @friend = Friend.find(params[:id])
  end
  def update
    @friend = Friend.find(params[:id])

    respond_to do |format|
      if @friend.update_attributes(params[:friend])
        format.html { redirect_to @friend, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @friend.errors, status: :unprocessable_entity }
      end
    end
  end
  def create
    @friend = Friend.new(params[:friend])
    if @friend.save
    	respond_to do |format|
		   format.html{redirect_to(@friend, :notice => 'Friend was successfully created.')}
		   format.json{render json:{'response'=>@friend}}
		end
    else
      render :action => "new"
    end
  end
  def ids
  	@uid = params[:uid]
  	@friends = Friend.find(:all, :conditions => [ "uid1 = ?", @uid])
  	render json:@friends
  end

  def details
  	@uid = params[:uid]
  	@friends = Friend.find(:all, :conditions =>["uid1 = ?",@uid])
  	@friends.each do |friend|
  		friend = User.find(friend[:uid2])
  	end
  	render json:@friends
  end

  def destroy
    @friend = Friend.find(params[:id])
    @friend.destroy
    redirect_to(friends_url)
  end 
end

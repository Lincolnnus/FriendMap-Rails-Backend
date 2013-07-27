class RequestsController < ApplicationController
	def index
    @requests = Request.all
  end
 
  def show
    @request = Request.find(params[:id])
    respond_to do |format|
    	format.html
   		format.json{render json:@request}
   	end
  end
  
  def new
    @request= Request.new
  end
  def edit
    @request= Request.find(params[:id])
  end
  def update
    @request = Request.find(params[:id])

    respond_to do |format|
      if @request.update_attributes(params[:request])
        format.html { redirect_to @request, notice: 'Request was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end
  def create
    @request = Request.new(params[:request])
    if @request.save
    	respond_to do |format|
		   format.html{redirect_to(@request, :notice => 'request was successfully created.')}
		   format.json{render json:{'response'=>@request}}
		end
    else
      render :action => "new"
    end
  end
  def invitors
  	@uid = params[:uid]
  	@requests = Request.find(:all, :conditions => [ "uid = ?", @uid])
  	@requests.each do |request|
  		request = User.find(:all, :conditions =>["rrid = ? OR wbid= ?",request[:fid],request[:fid]])
  	end
  	render json:@requests
  end
  #accepted invitation
  def accepted
  	@uid= params[:uid]
  	@fid =params[:fid]
  	@uid2 = User.find(:first,:conditions=>["rrid = ? or wbid = ?",@fid,@fid])
 	@friend = Friend.new({"uid1"=>@uid,"uid2"=>@uid2[:id]})
    if @friend.save
    	respond_to do |format|
    	   @request =Request.find(:first,:conditions=>["uid = ? and fid = ?",@uid,@fid])
    	   @request.destroy
		   format.html{redirect_to(@friend, :notice => 'Request was successfully created.')}
		   format.json{render json:{'response'=>@friend}}
		end
    else
      render :action => "new"
    end
  end

  def invitees
  	@uid = params[:uid]
  	@user = User.find(@uid)
  	@requests = Request.find(:all, :conditions =>["fid = ?",@user[:fid]])
  	@requests.each do |request|
  		request = User.find(request[:uid])
  	end
  	render json:@requests
  end
  
  def destroy
    @request = Request.find(params[:id])
    @request.destroy
    redirect_to(requests_url)
  end 
end

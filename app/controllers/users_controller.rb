class UsersController < ApplicationController

  def index
    @users = User.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])

	if @user.save
	  render json: @user, status: :created, location: @user
	else
	  render json: @user.errors, status: :unprocessable_entity
	end
  end

  def rrlogin
    @user = User.find(:first, :conditions => [ "rrid = ?", params[:rrid]])
    if(!@user)
    	if (params[:rrid]&&params[:name]&&params[:thumbnail])
			@user = User.new({:name => params['name'], :rrid => params['rrid'],:thumbnail =>params['thumbnail']})
		    session[:thumbnail] =@user['thumbnail']
		    session[:name] = @user['name']
		    session[:rrid] = @user['rrid']
		    if @user.save
		    	session[:uid] = @user['id']
		    	respond_to do |format|
		    		format.json{render json: @user, status: :created, location: @user}
		   		end
		    else
		    	respond_to do |format|
		    		format.json{render json: @user.errors, status: :unprocessable_entity}
		    	end
		    end
		else
			respond_to do |format|
				format.json{render json: {'response'=>'fail'}}
			end
		end
	else
		session[:uid] = @user['id']
		session[:thumbnail] =@user['thumbnail']
		session[:name] = @user['name']
		session[:rrid] = @user['rrid']
		respond_to do |format|
        	format.html { redirect_to '/users/'+@user['id'].to_s, notice: 'User login successful.' }
	    	format.json{render json: @user, status: :created, location: @user}
	    end
	end
  end
  def login

  end
  def logout
	session[:uid] = nil
	session[:thumbnail] = nil
	session[:name] = nil
	session[:rrid] = nil
	respond_to do |format|
		format.html{ redirect_to '/'}
   		format.json{render json:{'response'=> 'success'}}
   	end
  end

  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @team, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
end

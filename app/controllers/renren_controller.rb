class RenrenController < ApplicationController
	require 'oauth2'         
	require 'json'         
	require 'net/http'   
	def api_key
	 'c6e5f5a7b7754fcbb9b1f3ae41d290ee'
	end
	def api_secret
	 'e5c3801b02634b979d71b2e736ad4ed8'
	end     
	def client_id
	 '139427'
	end  
	def client

	OAuth2::Client.new(api_key,api_secret,:site => {:url=>'https://graph.renren.com',:response_type=>'code'},:access_token_url => 'https://graph.renren.com/oauth/token')
	#第一步：获取Authorization Code    

	end      
	def login         
		         
		redirect_to client.authorize_url(
				 :client_id => client_id,
		         
		         :redirect_uri => "http://localhost:3000/renren/loginnext",
		         
		         :response_type=>'code'         
		         
		)
	 
	 end    
	 #第二步：使用Authorization Code换取Access Token         
	 
	 def loginnext         
		access_token = client.get_token({
			  :grant_type=>'authorization_code',
		      :client_id => client_id,
		      :client_secret => api_secret,
		      :redirect_uri => 'http://localhost:3000/renren/loginnext',
		      :code => params[:code].to_s
		})

		session[:renren_access_token]=access_token.token
		         
		redirect_to "/renren/user"#定向到我们的应用页面         
	 
	 end         
	 
	 def inviteRenren
	 end

	 def inviteWeibo
	 end
	 
	 
	 def user         
		geturi=URI.parse(URI.encode("https://api.renren.com/v2/user/login/get?access_token=#{session[:renren_access_token]}"))       
		@response = JSON Net::HTTP.get(geturi)
		@rruser = @response['response']
		@user = User.find_by_rrid  'rr_'+@rruser['id'].to_s
		if(!@user)
			@user = User.new({:name => @rruser['name'], :rrid => 'rr_'+@rruser['id'].to_s,:thumbnail =>@rruser['avatar'][1]['url'],:token =>session[:renren_access_token]})
		    session[:thumbnail] =@user['thumbnail']
		    session[:name] = @user['name']
		    session[:rrid] = @user['rrid']
		    if @user.save
		    	redirect_to '/'
		    else
		    	render json: @user.errors, status: :unprocessable_entity
		    end
		else
			session[:uid] = @user['id']
			session[:thumbnail] =@user['thumbnail']
			session[:name] = @user['name']
			session[:rrid] = @user['rrid']
		    redirect_to '/'
		end
	 end         
	 
	 def redirect_uri         
	 
		uri = URI.parse(request.url)
		         
		uri.path = '/renren/loginnext'         
		         
		uri.query = nil         
		         
		uri.to_s         
	 
	 end                
end

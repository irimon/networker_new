class SessionsController < ApplicationController

	LINKEDIN_CONFIGURATION = { :site => 'https://api.linkedin.com',
                    :authorize_path => '/uas/oauth/authenticate',
                    :request_token_path =>'/uas/oauth/requestToken?scope=r_basicprofile+r_network+rw_nus+r_emailaddress',
					:access_token_path => '/uas/oauth/accessToken'}

	def new
	end

	def create
	
		user = User.find_by_email(params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			sign_in user
			#render 'show'
			redirect_to user
		else
			flash.now[:error] = 'Invalid email/password combination'
			render 'new'
		end
	end
	
	def destroy
		sign_out
		redirect_to root_url
    end
	
	

	def linkedin
		# get your api keys at https://www.linkedin.com/secure/developer
	
		client = LinkedIn::Client.new("w75zrekv8gjb", "DJSzP42FD0XVLro0", LINKEDIN_CONFIGURATION)
		request_token = client.request_token(:oauth_callback =>
                                      "http://#{request.host_with_port}/sessions/callback")
		session[:rtoken] = request_token.token
		session[:rsecret] = request_token.secret

		redirect_to client.request_token.authorize_url

	end	

	def callback
		client = LinkedIn::Client.new("w75zrekv8gjb", "DJSzP42FD0XVLro0")

		if session[:atoken].nil?
			pin = params[:oauth_verifier]
			atoken, asecret = client.authorize_from_request(session[:rtoken], session[:rsecret], pin)
			session[:atoken] = atoken
			session[:asecret] = asecret
		else
			client.authorize_from_access(session[:atoken], session[:asecret])
		end
	
		@ref_profile = client.profile
		@ref_connections = client.connections
		@my_connections = Connection.new
		
		if signed_in?
		
			if current_user.BasicProfile.nil?
				new_profile = BasicProfile.new
				new_profile.first_name = @ref_profile.first_name
				new_profile.last_name = @ref_profile.last_name
				new_profile.headline = @ref_profile.headline
				new_profile.industry = @ref_profile.industry
				current_user.BasicProfile = new_profile
				
				@ref_connections.all.each_with_index do |con,ind|
					@connection = Connection.new
					@connection.first_name = con.first_name
					@connection.last_name = con.last_name
					@connection.industry = con.industry
					current_user.connections.create(:first_name => con.first_name, :last_name => con.last_name, :industry => con.industry)
				end
			end
		
			redirect_to current_user
		else
		
			#@connections = get_connections
			render 'sessions/create' 
		end
	end
 
	def  get_profile
		@profile = BasicProfile.find_by_user_id(current_user.id)
		render 'profile'
	end
  
	def get_connections
		#@connections = current_user.connections
		#@Connections = Connection.order(params[:sort])
		@Connections = current_user.connections
		render 'connections'
	end
   
end

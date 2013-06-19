class SkillsController < ApplicationController
	LINKEDIN_CONFIGURATION = { :site => 'https://api.linkedin.com',
                    :authorize_path => '/uas/oauth/authenticate',
                    :request_token_path =>'/uas/oauth/requestToken?scope=r_basicprofile+r_network+rw_nus+r_emailaddress',
					:access_token_path => '/uas/oauth/accessToken'}

  def create
		client = LinkedIn::Client.new("w75zrekv8gjb", "DJSzP42FD0XVLro0")

		if session[:atoken].nil?
			pin = params[:oauth_verifier]
			atoken, asecret = client.authorize_from_request(session[:rtoken], session[:rsecret], pin)
			session[:atoken] = atoken
			session[:asecret] = asecret
		else
			client.authorize_from_access(session[:atoken], session[:asecret])
		end
	
		@feed = client.network_updates(:type => 'PRFU', :count => '100')
		@skill = Skill.new(params[:skill])
		#for i in 0..@skills.length
			@feed.all.each do |feed| 
				if !feed.to_hash["update_content"]["person"]["skills"].nil? 
					feed.to_hash["update_content"]["person"]["skills"]["all"].each do |item|
						if @skill == item.to_hash["skill"]["name"]
							@f_name = feed.to_hash["update_content"]["person"]["first_name"] 
							@l_name = feed.to_hash["update_content"]["person"]["last_name"] 
						end
					end
				end
			end
		#end
	end
  end

class ConnectionsController < ApplicationController
	before_filter :signed_in_user, only: [:create, :destroy]
	def create
		@connection = current_user.connections.build(params[:connection])
		if @connection.save
			redirect_to root_url
		else
			@feed_items = []
			render 'static_pages/home'
		end
  end

end

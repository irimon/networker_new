class BasicProfilesController < ApplicationController
	def create
    @profile = current_user.BasicProfile.build(params[:BasicProfile])
    if @profile.save
      flash[:success] = "Profile created!"
      redirect_to root_url
    else
      render 'users/show'
    end
  end
end

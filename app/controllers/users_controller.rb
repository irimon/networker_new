class UsersController < ApplicationController
  def show
   @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  
  
  def create
	@user = User.new(params[:user])
	if @user.save
	  sign_in @user
	  flash[:success] = "Welcome to Networker Elite!"
      redirect_to @user 
    else
      render 'new'
    end
  end
  
  # def profile
	# @user = User.find(params[:id])
	# @profile = @user.BasicProfile
	# rediret_to @profile
  # end
  
  
   private

   	
	def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
	
end

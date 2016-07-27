class UsersController < ApplicationController
  def index
  	
  end

  def create
     	user = User.new(user_params)
	  if user.save
		  session[:user_id] = user.id
		  redirect_to "/wall"
	 else
	 	  flash[:errors]= user.errors.full_messages
		  redirect_to :back
	 end
  end

  def new
  end

  private
  	def user_params
  		params.require(:user).permit(:name, :email, :password, :password_confirmation)
  	end	
end

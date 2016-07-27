class WallController < ApplicationController
  def index
  	@user = User.find(session[:user_id])
  	@message = Message.all
  end

  def create
  	message = Message.new(message_params)
  	flash[:errors] = message.errors.full_messages unless message.save
  	redirect_to :back
  end

 

  def message_params
 	params.require(:message).permit(:user_id, :content)
 	end
end

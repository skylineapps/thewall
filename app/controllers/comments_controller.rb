class CommentsController < ApplicationController
  def create
  	user = User.find(session[:user_id])
  	comment = user.comments.new(comments_params)
  	flash[:errors] = comment.errors.full_messages unless comment.save
  	redirect_to :back
  end

  def destroy
  end

  private
  def comments_params
  	params.require(:comment).permit(:content, :message_id)
  end
end

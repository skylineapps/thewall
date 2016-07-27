class LikesController < ApplicationController
	def create
		like = Like.find_by(user_id: session[:user_id], message_id: params[:id])
		if like
			flash[:errors] = ["You already liked"]

		else
		message = Message.find(params[:id])
		current_vote = message.vote
		new_vote = current_vote +1
		message.update(vote: new_vote)
		Like.create(user_id: session[:user_id], message_id: params[:id])
		end
		redirect_to :back
	end
end
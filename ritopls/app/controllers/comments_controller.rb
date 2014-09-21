class CommentsController < ApplicationController
	def create
  		@current_user ||= User.find_by(cookies[:id])
  		@comment = Comment.new(params.require(:comment).permit(:text, :champion_id))
  		@comment[:user_id] = @current_user[:id]
		if @comment.save
			redirect_to :back
		end
	end
end

class CommentsController < ApplicationController
	def create
    begin
		  current_user = User.find(cookies['id'])
      @comment = Comment.new(params.require(:comment).permit(:text, :champion_id))
      @comment[:user_id] = current_user[:id]
      @comment[:username] = current_user[:username]
    rescue
      redirect_to :back
    end
  		if @comment[:text] == ""
  		  redirect_to :back
  		else @comment.save
		    redirect_to :back
		  end
	end

  def destroy
    begin
      @comment = Comment.find(params[:id])
      @comment.destroy
      redirect_to :back
    rescue
      redirect_to :back
    end
           
  end

  def edit
    begin
      @comment = Comment.find(params[:id])
      @champion = Champion.find_by(id: @comment[:champion_id].to_i )
      @comments = Comment.where(champion_id: @champion[:id].to_s)
    rescue
      redirect_to :back
    end
 
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment[:text].empty? == true
        @comment.destroy
        redirect_to champion_path(@comment[:champion_id].to_i)
    else 
      @comment.update_attributes(params.require(:comment).permit(:text))
      redirect_to champion_path(@comment[:champion_id].to_i)
    end
  end

end

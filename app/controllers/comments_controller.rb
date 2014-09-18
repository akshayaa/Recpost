class CommentsController < ApplicationController
	def create
		@post = Post.find params[:post_id]
		@comment = @post.comments.new(comment_params)
		@comment.user_id = current_user.id
		if @comment.save
			redirect_to @post, notice: 'comment was successfully saved!'
		else
			flash[:alert] = "comment was not created!"
			render 'new'
		end
	end

	def destroy
	end

	private
	def comment_params
		params.require(:comment).permit(:content)
	end
end

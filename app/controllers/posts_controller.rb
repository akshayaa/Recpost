class PostsController < ApplicationController
	def new
		@post = Post.new
	end

	def index 
		if current_user == nil
			redirect_to welcome_path
		end
		@posts = Post.all
	end

	def show 
		@post = Post.find params[:id]
	end

	def create
		@post = Post.new post_params
		@post.user_id = current_user.id
		if @post.save
			redirect_to @post, notice: 'post was successfully saved!'
		else
			flash[:alert] = "post was not created!"
			render 'new'
		end
	end

	def edit
		@post = Post.find params[:id]
	end

	def update
		@post = Post.find params[:id]

		if @post.update_attributes	update_params
			redirect_to @post, notice: 'post was updated!'
		else
			flash[:alert] = "post could not be updated!"
			render 'new'
		end
	end

	def destroy
		Post.find(params[:id]).delete
		redirect_to root_path
	end

	private 
	def post_params
		params.require(:post).permit(:post_id, :user_id, :title, :content)
	end

	def update_params
		params.require(:post).permit(:title, :content)
	end

end

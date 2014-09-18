class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def show 
		@user = User.find params[:id]
	end

	def create
		@user = User.new user_params
		if @user.save
			redirect_to root_path, notice: 'User created!'
			session[:user_id] = @user.id
		else
			flash[:alert] = "User was not created!!"
			render 'new'
		end
	end

	def edit
		@user = User.find params[:id]
	end

	def update
		@user = User.find params[:id]
		if @user.update_attributes user_params
			redirect_to @user, notice: 'user info was updated!'
		else
			flash[:alert] = "user could not be updated!"
			render 'new'
		end
	end

	def destroy
		@user = User.find(params[:id]).delete
	end

	private 
	def user_params
		params.require(:user).permit(:username, :email, :password, :password_confirmation)
	end
end

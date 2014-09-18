class SessionsController < ApplicationController

	def new 
	
	end

	def create 
		@user = User.find_by_username(params[:session][:username] )

		if @user && @user.authenticate(params[:session][:password] )
			session[:user_id] = @user.id
			redirect_to root_path, notice: 'Succesfully signed in!!'
		else
			flash.now[:error] = "Invalid email/password combination!"
			render 'new'
		end
		
	end

	def destroy
		reset_session
		redirect_to about_path
	end

end

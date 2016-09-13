class UsersController < ApplicationController
	def index		
		@users = User.all
	end

	def show	
		@user = User.find(params[:id])
	end

	def new
		@user = User.new	
	end

	def create
		@user = User.new(user_params)
		if @user.valid?
			@user.save
			redirect_to @user
		else
			render 'new'  
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		@user.update_attributes(user_params)
		if @user.valid?
			@user.save
			redirect_to @user
		else
			render 'edit'
		end
	end

	def destroy
		User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_path
	end

	private

	def user_params
		params.require(:user).permit(:name, :email)
	end
end
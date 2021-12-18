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


	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update(params.require(:user).permit(:name, :email, :address))
			flash[:notice] = "User Edited Successfully"
			redirect_to @user
		else
			render 'edit'
		end
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		redirect_to users_path
	end

	def create
		# render plain: params[:user]
		@user = User.new(params.require(:user).permit(:name, :email, :address))
		if @user.save
			flash[:notice] = "User registered Successfully"
			redirect_to @user
		else
			render 'new'
		end
	end
end
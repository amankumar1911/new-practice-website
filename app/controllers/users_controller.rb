class UsersController < ApplicationController
	def index
		@users = User.all
	end
	def show
		@user = User.find(params[:id])
	end
	def new
		# @users = User.new
	end
	def create
		# render plain: params[:user]
		@user = User.new(params.require(:user).permit(:name, :email, :address))
		@user.save
		redirect_to @user
	end
end
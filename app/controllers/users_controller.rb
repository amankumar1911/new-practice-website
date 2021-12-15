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
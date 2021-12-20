class UsersController < ApplicationController

	before_action :set_user, only: [:show, :edit, :update, :destroy]

	def index
		@users = User.all
	end

	def show
	end

	def new
		@user = User.new
	end


	def edit
	end

	def update
		if @user.update(user_param)
			flash[:notice] = "User Edited Successfully"
			redirect_to @user
		else
			render 'edit'
		end
	end

	def destroy
		@user.destroy
		redirect_to users_path
	end

	def create
		# render plain: params[:user]
		@user = User.new(user_param)
		if @user.save
			flash[:notice] = "User registered Successfully"
			redirect_to @user
		else
			render 'new'
		end
	end

	private

	def set_user
		@user = User.find(params[:id])
	end

	def user_param
		params.require(:user).permit(:name, :email, :address)
	end

end
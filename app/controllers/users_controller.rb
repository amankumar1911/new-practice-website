class UsersController < ApplicationController

	before_action :set_user, only: [:show, :edit, :update]

	def index
		@users = User.paginate(page: params[:page], per_page: 3)
	end

	def show
		@articles = @user.articles.paginate(page: params[:page], per_page: 3)
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

	# def destroy
	# 	@user.destroy
	# 	redirect_to users_path
	# end

	def create
		# render plain: params[:user]
		@user = User.new(user_param)
		if @user.save
			session[:user_id] = @user.id
			flash[:notice] = "Welcome to Alpha blog #{@user.username}, you have successfully signed up"
			redirect_to articles_path
		else
			render 'new'
		end
	end

	private

	def set_user
		@user = User.find(params[:id])
	end

	def user_param
		params.require(:user).permit(:username, :email, :password)
	end

end
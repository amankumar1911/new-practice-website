class UsersController < ApplicationController

	before_action :set_user, only: [:show, :edit, :update, :destroy]
	before_action :require_login, except: %i[show index new create]
	before_action :require_same_user, only: %i[edit update destroy]

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

	def destroy
		@user.destroy
		session[:user_id] = nil if @user == current_user
		flash[:alert] = "Your profile and associated articles is deleted"
		redirect_to root_path
	end

	private

	def set_user
		@user = User.find(params[:id])
	end

	def user_param
		params.require(:user).permit(:username, :email, :password)
	end

	def require_same_user
      if current_user != @user && !current_user.admin?
        flash[:alert] = "You can only edit or delete your own profile"
        redirect_to @user
      end
    end
end
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
		render plain: params[:user]
	end
end
class PagesController < ApplicationController
	def home
		redirect_to articles_path if logged_in?
	end
	# def hello
	# 	render html: 'Hello World!'
	# end
	def about
	end
end

class OrdersController < ApplicationController

	def index
	end
	
	def show
	end

	def create
	end

	def new
	end 	

	def destroy
	end

	before_filter :authenticate_user!

end 	
class StaticPagesController < ApplicationController
  def index
  
  end

  def landing_page
  	# redirect_to static_pages_index_path
  	@featured_product = Product.first
  	@products = Product.limit(5)
  end

  def thank_you
	  @name = params[:name]
	  @email = params[:email]
	  @message = params[:message]
	  ActionMailer::Base.mail(:from => @email,
	    :to => 'your-email@example.com',
	    :subject => "A new contact form message from #{@name}",
	    :body => @message).deliver_now
	end
end

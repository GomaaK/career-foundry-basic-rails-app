class PaymentsController < ApplicationController

	def create
		
		@product_id = params[:product_id]
		@product_price = params[:price]
		@product_description = params[:description]
		@user = current_user

		# Set your secret key: remember to change this to your live secret key in production
		# See your keys here https://dashboard.stripe.com/account/apikeys
		Stripe.api_key = "sk_test_c3fEt1Psxt73s1amUx5cIaqj"

		# Get the credit card details submitted by the form
		token = params[:stripeToken]

		# Create the charge on Stripe's servers - this will charge the user's card
		begin
		  charge = Stripe::Charge.create(
		    :amount => @product_price,  # amount in cents, again
		    :currency => "EUR",
		    :source => token,
		    :description => @product_description
		  )
		 	 
		  if charge.paid
	  		Order.create()
			end

		rescue Stripe::CardError => e
		  # The card has been declined
		end	
			redirect_to static_pages_thank_you_path

	end

end
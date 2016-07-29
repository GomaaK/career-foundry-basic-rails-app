class PaymentsController < ApplicationController

	def create
		
		@product = params[:product_id]
		@user = current_user

		# Set your secret key: remember to change this to your live secret key in production
		# See your keys here https://dashboard.stripe.com/account/apikeys
		Stripe.api_key = "sk_test_c3fEt1Psxt73s1amUx5cIaqjs"

		# Get the credit card details submitted by the form
		token = params[:stripeToken]

		# Create the charge on Stripe's servers - this will charge the user's card
		begin
		  charge = Stripe::Charge.create(
		    :amount => @product.price.to_i * @product.stripe_price_conversion,  # amount in cents, again
		    :currency => "EUR",
		    :source => token,
		    :description => @product.description
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
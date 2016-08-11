class PaymentsController < ApplicationController

	def create
		@product = Product.find params[:product_id]
		@user = current_user

		# Set your secret key: remember to change this to your live secret key in production
		# See your keys here https://dashboard.stripe.com/account/apikeys
		Stripe.api_key = "sk_test_c3fEt1Psxt73s1amUx5cIaqj"

		# Get the credit card details submitted by the form
		token = params[:stripeToken]

		# Create the charge on Stripe's servers - this will charge the user's card
		begin
		  charge = Stripe::Charge.create(
		    :amount => (@product.price * 100).to_i,  # amount in cents, again
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
			redirect_to payments_thank_you_path
	end

	def thank_you

	end
end


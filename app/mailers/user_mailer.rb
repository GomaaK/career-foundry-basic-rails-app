class UserMailer < ApplicationMailer

	default from: "frome@example.com"

	def contact_form(email, name, message)
		@message = message
			mail(:from => email,
				:to => 'your-example@example.com',
				:subject => "A new contact form from #{name}")
	end		
end

class Product < ActiveRecord::Base
	
	has_many :orders
	has_many :comments

	def average_rating
    comments.average(:rating).to_f
  end	

  def stripe_price_conversion
  	$stripe_conversion_factor = 100
  end 	

	validates :name, presence: true
end


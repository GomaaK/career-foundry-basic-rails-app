class StaticPagesController < ApplicationController
  def index
  end

  def landing_page
  	# redirect_to static_pages_index_path
  	@featured_product = Product.first
  	@products = Product.limit(5)
  end

  def price_change
  end

end

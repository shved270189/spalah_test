class ShopController < ApplicationController
  def index
    @products = ShopService.products
  end
end

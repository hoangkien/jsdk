class ProductsController < ApplicationController

  def show
    if check_category?(params[:name_url])
      render "category"
    else
      @product = Product.where(name_url: params[:name_url])
      render "show"
    end
  end

end

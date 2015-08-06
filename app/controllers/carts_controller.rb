class CartsController < ApplicationController

  def cart
    @carts = session[:cart]
  end

  def destroy
    session[:cart].delete( "#{ params[:id] }" )
    @total = session[:cart].map { |id,qty|  Product.find( id.to_i ).price * qty }.reduce(:+) || 0
    @id = params[:id]
    respond_to do | format |
      format.js{}
    end
  end

end

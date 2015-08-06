class OrdersController < ApplicationController
  skip_before_filter  :verify_authenticity_token

  def add_cart
    update_cart(params[:id],params[:quantity])
    @content = render_to_string(:partial => "/products/order",:formats => [:html], :layout => false, :locals => { :@product => @current_product, :@total => @total, :@quantity => @quantity, :@product_quantity => params[:quantity] })
    respond_to do |format|
      format.html{}
      format.js{@content}
    end
  end

end

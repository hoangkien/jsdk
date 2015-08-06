class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_name

  def current_name
    unless session[:name].nil?
      byebug
    end

  end

  def check_category?(name_url)

    if name_url== 'hang-moi-ve'
      @products = Product.all.order(id: :desc).limit(10)
      @cate = "Hàng mới về"
      return true
    elsif name_url == 'hang-ban-chay-nhat'
      @products = Product.all.order(id: :desc).limit(10)
      @cate = "Hàng bán chạy nhất"
      return true
    elsif Category.where(name_url: name_url ).exists?
      category = Category.find_by(name_url: name_url)
      @products = category.products
      @cate = category.name
      return true
    else
      return false
    end

  end

  def update_cart(id,quantity)
    @current_product = Product.find(id)
    session[:cart] ||= {}
    session[:cart].has_key?(id) ? session[:cart][id] += quantity.to_i : session[:cart].merge!(id => quantity.to_i)
    @quantity = session[:cart].length
    @total = session[:cart].map { |key,value| Product.find(key.to_i).price * value }.reduce(:+)
  end

  def check_carts
    if user_signed_in?

    end
  end

end

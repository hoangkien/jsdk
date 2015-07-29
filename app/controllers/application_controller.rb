class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def check_category?(name_url)

    if name_url== 'hang-moi-nhat'
      @products = Product.all.order(id: :desc).limit(10)
      return true
    elsif name_url == 'ban-chay-nhat'
      @products = Product.all.order(id: :desc).limit(10)
      return true
    elsif Category.where(name_url: name_url ).exists?
      category = Category.find_by(name_url: name_url)
      @products = category.products
      return true
    else
      return false
    end

  end

end

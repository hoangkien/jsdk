class Category < ActiveRecord::Base
  has_many :products
  attr_accessible :name, :name_url
  after_initialize :list_product

  def list_product
    products.collect{|p| p.name }
  end

end

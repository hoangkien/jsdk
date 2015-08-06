class Product < ActiveRecord::Base
  require 'carrierwave/orm/activerecord'

  belongs_to :category
  has_many :orders, dependent: :destroy

  mount_uploader :image, ImageUploader

  before_save :save_name_url

  validate :category_present



  def save_name_url
    self.name_url = ApplicationController.helpers.set_name_url(self.name)
  end

  private
  def category_present
    if category.nil?
      errors.add(:category,"is invalid")
    end
  end

end

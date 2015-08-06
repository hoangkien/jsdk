class AddNameUrlToProduct < ActiveRecord::Migration
  def change
    add_column :products, :name_url, :string, default: false
  end
end

class AddColumnNameUrlToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :name_url, :string
  end
end

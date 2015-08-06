ActiveAdmin.register Product do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end

  permit_params :name, :code, :price, :image, :origin, :color, :size, :category_id, :name_url, :details

  index do
    selectable_column
    id_column
    column :name
    column :code
    column :category
    column :image do |product|
      image_tag(product.image.url(:thumb))
    end
    column :price do |product|
      number_to_currency(product.price,unit: "$")
    end
    column :size
    column :origin
    actions
  end

  filter :name
  filter :price
  filter :origin
  filter :category

  form do |f|
    f.inputs "Product Details" do
      f.input :name
      f.input :code
      f.input :category_id, :as => :select, :collection => Category.all.map {|cate| [cate.name, cate.id]}, :include_blank => false
      f.input :price
      f.input :image, :as => :file
      f.input :origin
      f.input :color, :as => :string
      f.input :size
      f.input :details, :as => :ckeditor
    end
    f.actions
  end

  show do
    attributes_table do
      row :name
      row :code
      row :category
      row :image do
        image_tag product.image.url(:thumb)
      end
      row :price do
        number_to_currency(product.price,unit: "$")
      end
      row :origin
      row :color
      row :size
      row :details do
        raw product.details
      end
    end
    active_admin_comments
  end

  controller do
    # This code is evaluated within the controller class

    def define_a_method
      # Instance method
    end
  end

end

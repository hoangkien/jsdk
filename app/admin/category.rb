ActiveAdmin.register Category do

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
  permit_params :name, :name_url

  index do
  selectable_column
  id_column
  column :name
  column :name_url
  actions
  end

  form do |f|
    f.inputs "Categories Details" do
      f.input :name
      f.input :name_url
    end
    f.actions
  end

end

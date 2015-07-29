class CreateProduct < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name,null:false, default:""
      t.string :code,null:false, default:""
      t.integer :price,null:false, default:0
      t.string :image,null:false, default:""
      t.string :origin,null:false, default:""
      t.string :color
      t.string :size,null:false, default:""
      t.integer :category_id
    end
  end
end

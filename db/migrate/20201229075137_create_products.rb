class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string  :product_name,        null:false
      t.text    :product_explanation, null:false
      t.integer :category_id,         null:false
      t.integer :commodity_id,        null:false
      t.integer :burden_delivery_id,  null:false
      t.integer :event_region_id,     null:false
      t.integer :dispatch_nichiji_id, null:false
      t.integer :price,               null:false
      t.timestamps
    end
  end
end


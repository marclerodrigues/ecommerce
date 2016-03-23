class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price
      t.float :quantity
      t.float :height
      t.float :width
      t.float :depth
      t.float :weight
      t.text :description

      t.timestamps null: false
    end
  end
end

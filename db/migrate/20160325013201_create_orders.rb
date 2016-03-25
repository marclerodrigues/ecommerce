class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :client, index: true, foreign_key: true
      t.text :details
      t.decimal :total

      t.timestamps null: false
    end
  end
end

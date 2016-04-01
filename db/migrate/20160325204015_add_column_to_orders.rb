class AddColumnToOrders < ActiveRecord::Migration
  def change
    add_reference :orders, :client, index: true, foreign_key: true
  end
end

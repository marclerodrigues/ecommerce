class AddColumnToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :deliver_at, :string
  end
end

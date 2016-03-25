class Item < ActiveRecord::Base
  belongs_to :product

  accept_nested_attributes_for :product
end

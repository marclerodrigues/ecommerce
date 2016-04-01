class Item < ActiveRecord::Base
  belongs_to :order, :inverse_of => :items
  validates :order, :presence => true
end

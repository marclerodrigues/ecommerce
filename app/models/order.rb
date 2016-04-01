class Order < ActiveRecord::Base
  has_many :items, :inverse_of => :order, :dependent => :destroy
  accepts_nested_attributes_for :items, :reject_if => lambda { |a| a[:product_id].blank? }, :allow_destroy => true
  validates :items, :presence => true
end

class Order < ActiveRecord::Base
  has_many :item
  belongs_to :client
end

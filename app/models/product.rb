class Product < ActiveRecord::Base
  attr_accessor :image, :remote_img_url
  validates :name, :price, :quantity, :description, :presence => true
  mount_uploader :image, ImageUploader
  belongs_to :category
end

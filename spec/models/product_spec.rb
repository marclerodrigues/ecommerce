require 'rails_helper'

RSpec.describe Product, type: :model do

  let(:product) { FactoryGirl.create(:product) }
  let(:invalid_product) { FactoryGirl.build(:invalid_product) }

  it 'has a valid factory' do
    expect(product).to be_valid
  end

  it 'has a invalid factory' do
    expect(invalid_product).not_to be_valid
  end

  context 'is a invalid product' do
    it 'without name' do
      product.name = nil
      expect(product).not_to be_valid
    end
    it 'without price' do
      product.price = nil
      expect(product).not_to be_valid
    end
    it 'without quantity' do
      product.quantity = nil
      expect(product).not_to be_valid
    end
    it 'without description' do
      product.description = nil
      expect(product).not_to be_valid
    end
  end

  context 'is a valid product' do
    it 'without image' do
      product.image = nil
      expect(product).to be_valid
    end

    it 'without height' do
      product.height =  nil
      expect(product).to be_valid
    end

    it 'without width' do
      product.width = nil
      expect(product).to be_valid
    end

    it 'without depth' do
      product.depth = nil
      expect(product).to be_valid
    end
  end

end
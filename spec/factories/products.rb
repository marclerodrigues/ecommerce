FactoryGirl.define do
  factory :product do
    name "Cellphone"
    image "image"
    price "9.99"
    quantity 10
    height 1.5
    width 1.5
    depth 1.5
    weight 1.5
    description "Smartphone high end!"
  end

  factory :invalid_product, parent: :product do
    name nil
  end
end

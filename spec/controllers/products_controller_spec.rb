require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  describe "GET #index" do
    it 'populates @products' do
      product = FactoryGirl.create(:product)
      get :index
      expect(assigns(:products)).to eq([product])
    end
    it 'renders index view' do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "GET #show" do
    it 'populate @product' do
      product = FactoryGirl.create(:product)
      get :show, id: product.id
      expect(assigns(:product)).to eq(product)
    end
    it 'render show view' do
      get :show, id: FactoryGirl.create(:product)
      expect(response).to render_template :show
    end
  end

  describe "GET #new" do
    it 'render new templete' do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it 'creates a new product' do
        expect{
          post :create, product: FactoryGirl.attributes_for(:product)
        }.to change(Product, :count).by(1)
      end
      it 'redirect to the new product' do
        post :create, product: FactoryGirl.attributes_for(:product)
        expect(response).to redirect_to Product.last
      end
    end
    context "with invalid attributes" do
      it 'does not save the contact' do
        expect{
          post :create, product: FactoryGirl.attributes_for(:invalid_product)
        }.not_to change(Product, :count)
      end
      it 're-renders the new template' do
        post :create, product: FactoryGirl.attributes_for(:invalid_product)
        expect(response).to render_template :new
      end
    end
  end

  describe "PUT #update" do
    before :each do
      @product = FactoryGirl.create(:product, name: "Laptop", quantity: 10)
    end

    context "with valid attributes" do
      it 'located the request @product' do
        post :update, id: @product, product: FactoryGirl.attributes_for(:product)
        expect(assigns(:product)).to eq(@product)
      end

      it 'changes the product attributes' do
        post :update, id: @product, product: FactoryGirl.attributes_for(:product, name: "Giant Laptop 27 inches")
        @product.reload
        expect(@product.name).to eq("Giant Laptop 27 inches")
      end

      it 'redirects to the updated product' do
        post :update, id: @product, product: FactoryGirl.attributes_for(:product)
        expect(response).to redirect_to @product
      end
    end

    context "with invalid attributes" do
      it 'located the request @product' do
        put :update, id: @product, product: FactoryGirl.attributes_for(:invalid_product)
        expect(assigns(:product)).to eq(@product)
      end
      it 'does not saves the product' do
        put :update, id: @product, product: FactoryGirl.attributes_for(:invalid_product, name: "Big Computer", quantity: nil)
        @product.reload
        expect(@product.name).to eq("Laptop")
      end
      it 're-renders the edit method' do
        put :update, id: @product, product: FactoryGirl.attributes_for(:invalid_product)
        expect(response).to render_template :edit
      end
    end
  end

  describe "DELETE destroy" do
    before :each do
      @product = FactoryGirl.create(:product)
    end

    it 'deletes the product' do
      expect{
        delete :destroy, id: @product
      }.to change(Product, :count).by(-1)
    end

    it 'redirects to the products page' do
      delete :destroy, id: @product
      expect(response).to redirect_to products_path
    end
  end
end

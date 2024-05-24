require 'rails_helper'

RSpec.describe CartController, type: :controller do
    describe "POST #add_to_cart" do
        it "adds a product to the cart" do
            product = create(:product)
            post :add_to_cart, params: { product_id: product.id }
            expect(response).to have_http_status(:success)
            expect(JSON.parse(response.body)["added"]).to be_truthy
        end
    end
end
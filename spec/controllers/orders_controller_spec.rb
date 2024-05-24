require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
    describe "POST #create" do
        it "creates a new order" do
            product = create(:product)
            post :create, params: { product_id: product.id }
            expect(response).to have_http_status(:success)
            expect(Order.count).to eq(1)
        end
    end
    describe "DELETE #destroy" do
        it "destroys the specified order" do
            order = create(:order)
            delete :destroy, params: { id: order.id }


            expect(response).to redirect_to(orders_path)
            expect(flash[:notice]).to eq('Order was successfully destroyed.')
            expect(Order.count).to eq(0)
        end
    end
end
require 'rails_helper'

RSpec.describe CartController, type: :feature do
    describe "POST #clear_cart" do
        it "clears the cart" do
        # Agrega algunos productos al carrito para asegurarte de que no esté vacío
        product1 = create(:product)
        product2 = create(:product)
        post :add_to_cart, params: { product_id: product1.id }
        post :add_to_cart, params: { product_id: product2.id }

        # Llama a la acción para limpiar el carrito
        post :clear_cart

        expect(JSON.parse(response.body)).to eq({ "message" => "El carrito se ha limpiado correctamente" })
        end
    end

    describe "GET #cart_count" do
        it "returns the correct number of items in the cart" do
        # Agrega algunos productos al carrito
        product1 = create(:product)
        product2 = create(:product)
        post :add_to_cart, params: { product_id: product1.id }
        post :add_to_cart, params: { product_id: product2.id }

        # Llama a la acción para obtener el número total de elementos en el carrito
        get :cart_count

        # Verifica que el número total de elementos en el carrito sea el esperado
        expect(JSON.parse(response.body)["count"]).to eq(2)
        end
    end
end
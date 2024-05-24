require 'rails_helper'

RSpec.feature "Products", type: :feature do
    let!(:product) { create(:product) }

    scenario "User can see products on the index page" do
        visit products_path
        expect(page).to have_content(product.name)
    end

    scenario "User can add a product to the cart" do
        visit products_path
        click_button "Add to Cart"
        expect(page).to have_content("Producto agregado al carrito.")
    end

    scenario "User can see the cart count" do
        visit products_path
        expect(page).to have_content("0")
        click_button "Add to Cart"
        expect(page).to have_content("1")
    end
end

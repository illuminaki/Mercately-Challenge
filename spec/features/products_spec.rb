require 'rails_helper'

  RSpec.feature "Products", type: :feature do
    scenario "User can see products on the index page" do
      product = create(:product)
      visit products_path
      expect(page).to have_content(product.name)
    end

end 
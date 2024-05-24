require 'rails_helper'

RSpec.feature "Orders", type: :feature do
    scenario "User can see order details on the show page" do
        order = create(:order)
        visit order_path(order)
        expect(page).to have_content("Detalles de la Orden")
    end
end

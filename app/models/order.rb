# app/models/order.rb
class Order < ApplicationRecord
    has_many :order_items, dependent: :destroy
    has_many :products, through: :order_items

    validates :total, presence: true, numericality: { greater_than_or_equal_to: 0 }


    after_commit :calculate_total, on: :create

    def calculate_total
      calculated_total = order_items.joins(:product).sum('products.price')
      Rails.logger.info "Calculated total after commit: #{calculated_total}"
      update_column(:total, calculated_total)
    end
end

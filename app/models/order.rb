class Order < ApplicationRecord
  has_many :order_items, dependent: :destroy
  has_many :products, through: :order_items

  validates :total, presence: true
  validate :at_least_one_order_item

  before_validation :calculate_total

  private

  def calculate_total
    self.total = order_items.sum { |item| item.product.price }
    # Rails.logger.info "Calculated total before validation: #{self.total}"
  end

  def at_least_one_order_item
    errors.add(:base, "Debe haber al menos un producto en la orden") if order_items.empty?
  end
end

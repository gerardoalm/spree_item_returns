Spree::Order.class_eval do

  SHIPMENT_STATES = ['shipped', 'partial']
  scope :returned, -> { where(shipment_state: SHIPMENT_STATES) }

  def has_returnable_products?
    products.returnable.exists?
  end

  def has_returnable_line_items?
    line_items.any?(&:is_returnable?)
  end

end

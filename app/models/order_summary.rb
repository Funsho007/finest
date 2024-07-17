class OrderSummary < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    %w[id order_id summary created_at updated_at]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[order] # Include any associations that you want to be searchable
  end
end

class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy

  validates :status, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["status", "created_at", "updated_at"]
  end
end
#validates :name, presence: true

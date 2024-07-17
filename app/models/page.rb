class Page < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :content, presence: true
  validates :permalink, presence: true, uniqueness: true

  def self.ransackable_attributes(auth_object = nil)
    ["title", "permalink", "content", "created_at", "updated_at"]
  end
end

class StaticPage < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :content, presence: true

  def self.ransackable_attributes(auth_object = nil)
    %w[content created_at id title updated_at]
  end
end

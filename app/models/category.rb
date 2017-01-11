class Category < ApplicationRecord
  has_many :recipes
  validates :rakuten_id, uniqueness: true
end

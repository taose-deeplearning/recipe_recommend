class Recipe < ApplicationRecord
  acts_as_taggable_on :materials
  belongs_to :category
  validates :rakuten_id, uniqueness: true
end

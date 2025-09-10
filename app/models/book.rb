class Book < ApplicationRecord
  validates :published_date, presence: true
  validates :price,  presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :author, presence: true
  validates :title, presence: true
end


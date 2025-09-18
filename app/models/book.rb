class Book < ApplicationRecord
  has_many :users, through: :user_books
  has_many :user_books, dependent: :destroy

  validates :published_date, presence: true
  validates :price,  presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :author, presence: true
  validates :title, presence: true
end


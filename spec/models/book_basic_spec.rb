require "rails_helper"

RSpec.describe Book, type: :model do
  it "is valid with title, author, price, published_date" do
    b = Book.new(
      title: "Dune",
      author: "Frank Herbert",
      price: 9.99,
      published_date: Date.new(2020,1,1)
    )
    expect(b).to be_valid
  end

  it "is invalid without a title" do
    b = Book.new(
      title: "",
      author: "Someone",
      price: 1.00,
      published_date: Date.today
    )
    b.validate
    expect(b.errors[:title]).to be_present
  end
end

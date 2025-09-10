require 'rails_helper'

RSpec.describe Book, type: :model do
  it 'requires author' do
    b = Book.new(title: 'Dune', author: nil, price: 9.99, published_date: Date.today)
    b.validate
    expect(b.errors[:author]).to be_present
  end

  it 'requires numeric price' do
    b = Book.new(title: 'Dune', author: 'Frank Herbert', price: 'abc', published_date: Date.today)
    b.validate
    expect(b.errors[:price]).to be_present
  end

  it 'requires published_date' do
    b = Book.new(title: 'Dune', author: 'Frank Herbert', price: 9.99, published_date: nil)
    b.validate
    expect(b.errors[:published_date]).to be_present
  end
end

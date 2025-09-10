require 'rails_helper'

RSpec.describe 'Books (additional attrs)', type: :system do
  before { driven_by(:rack_test) }

  it 'creates a book with author/price/published_date' do
    visit new_book_path
    fill_in 'Title',  with: 'Dune'
    fill_in 'Author', with: 'Frank Herbert'
    fill_in 'Price',  with: '12.50'
    select '2020',    from: 'book_published_date_1i'
    select 'January', from: 'book_published_date_2i'
    select '1',       from: 'book_published_date_3i'
    click_button 'Create Book'

    expect(page).to have_text('Book was successfully created')
    click_link 'Show', match: :first
    expect(page).to have_text('Frank Herbert')
    expect(page).to have_text('12.5')
    expect(page).to have_text('2020')
  end

  it 'rejects non-numeric price (rainy)' do
    visit new_book_path
    fill_in 'Title',  with: 'Bad Price'
    fill_in 'Author', with: 'X'
    fill_in 'Price',  with: 'abc'
    select Date.today.year.to_s, from: 'book_published_date_1i'
    select Date::MONTHNAMES[Date.today.month], from: 'book_published_date_2i'
    select Date.today.day.to_s, from: 'book_published_date_3i'
    click_button 'Create Book'
    expect(page).to have_text('Price').and have_text('number').or have_text('invalid')
  end
end

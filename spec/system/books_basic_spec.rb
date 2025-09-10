require "rails_helper"

RSpec.describe "Books (basic)", type: :system do
  before { driven_by(:rack_test) }

  it "creates a book and shows success message" do
    visit new_book_path
    fill_in "Title",  with: "Dune"
    fill_in "Author", with: "Frank Herbert"
    fill_in "Price",  with: "12.50"
    select Date.today.year.to_s,               from: "book_published_date_1i"
    select Date::MONTHNAMES[Date.today.month], from: "book_published_date_2i"
    select Date.today.day.to_s,                from: "book_published_date_3i"
    click_button "Create Book"

    expect(page).to have_text("Book was successfully created")
    expect(page).to have_text("Dune")
  end

  it "shows an error when title is blank (rainy)" do
    visit new_book_path
    fill_in "Title",  with: ""
    fill_in "Author", with: "Anon"
    fill_in "Price",  with: "5.00"
    select Date.today.year.to_s,               from: "book_published_date_1i"
    select Date::MONTHNAMES[Date.today.month], from: "book_published_date_2i"
    select Date.today.day.to_s,                from: "book_published_date_3i"
    click_button "Create Book"

    expect(page).to have_text("Title can't be blank")
  end
end
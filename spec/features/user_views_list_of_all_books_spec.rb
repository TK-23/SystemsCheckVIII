require 'rails_helper'

feature "user views book listing", %q{
  As a User
  I want to view book a listing
  of all books
} do

  # Acceptance Criteria

  # - Must see all books listed on the /books path
  # - page contains links to more detailed info on each book

  scenario "navigates to books listing page and sees all books" do
    all_books = FactoryGirl.create_list(:book, 10)
    visit books_path

    all_books.each do |book|
      expect(page).to have_content book.title
      expect(page).to have_content book.author.name
      expect(page).to have_content book.year
    end
  end
end

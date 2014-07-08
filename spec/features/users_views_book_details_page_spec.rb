require 'rails_helper'

feature "user views book listing", %q{
  As a User
  I want to view book a listing
  of all books
} do

  # Acceptance Criteria

  # - Must have a details page for each book
  # - Details page contains all reviews and book details

  scenario "navigates to books listing page and sees all books" do
    all_books = FactoryGirl.create_list(:book_with_reviews, 10)
    (0..9).each do |i|
      visit books_path
      click_on all_books[i].title

      expect(page).to have_content all_books[i].title
      expect(page).to have_content all_books[i].author.name
      expect(page).to have_content all_books[i].year
      expect(page).to have_content all_books[i].description
      expect(page).to have_content all_books[i].category.name

      expect( all(".review_div").count ).to  eq(5)
      expect(page).to have_content all_books[i].reviews.first.rating
      expect(page).to have_content all_books[i].reviews.last.rating
      expect(page).to have_content all_books[i].reviews.first.body
      expect(page).to have_content all_books[i].reviews.last.body
    end
  end
end

require 'rails_helper'

feature "user creates new book review", %q{
  As a User I want to
  create a new book review
} do

  # Acceptance Criteria

  # - Must be able to add a review with rating and body
  # - User sees error messages when required info is missing and/or save fails

  scenario "user creates review with full information" do
    all_books = FactoryGirl.create_list(:book, 10)
    visit books_path

    click_on all_books[0].title
    fill_in "Rating", with: "5"
    fill_in "Body", with: "Great Book"
    click_on "Submit"

    expect(page).to have_content "Save Successful"
    expect(page).to have_content "Great Book"
    expect(page).to have_content "5"
  end

  scenario "user creates review with missing information" do
    all_books = FactoryGirl.create_list(:book, 10)
    visit books_path

    click_on all_books[0].title
    fill_in "Body", with: "Great Book"
    click_on "Submit"

    expect(page).to have_content "Review Save Failed"
  end

  scenario "user creates review with missing information" do
    all_books = FactoryGirl.create_list(:book, 10)
    visit books_path

    click_on all_books[0].title
    fill_in "Rating", with: "5"
    click_on "Submit"

    expect(page).to have_content "Review Save Failed"
  end

end

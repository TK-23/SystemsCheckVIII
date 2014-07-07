require 'rails_helper'

feature "user creates new book listing", %q{
  As a User I want to
  create a new book listing
} do

  # Acceptance Criteria

  # - Must be able to add a book and all its details
  # - User sees error messages when required info is missing and/or save fails

  scenario "user creates book with full information" do
    all_books = FactoryGirl.create_list(:book, 10)
    visit books_path

    click_on "Add new book"
    fill_in "Title", with: "Catcher in the Rye"
    fill_in "Author", with: "JD Salinger"
    fill_in "Year", with: "1951"
    fill_in "Category", with: "Fiction"
    fill_in "Description", with: "Anyone who has read J.D. Salinger's New Yorker stories ? particularly A Perfect Day for Bananafish, Uncle Wiggily in Connecticut, The Laughing Man, and For Esme ? With Love and Squalor, will not be surprised by the fact that his first novel is fully of children. The hero-narrator of THE CATCHER IN THE RYE is an ancient child of sixteen, a native New Yorker named Holden Caulfield. Through circumstances that tend to preclude adult, secondhand description, he leaves his prep school in Pennsylvania and goes underground in New York City for three days. The boy himself is at once too simple and too complex for us to make any final comment about him or his story. Perhaps the safest thing we can say about Holden is that he was born in the world not just strongly attracted to beauty but, almost, hopelessly impaled on it. There are many voices in this novel: children's voices, adult voices, underground voices-but Holden's voice is the most eloquent of all. Transcending his own vernacular, yet remaining marvelously faithful to it, he issues a perfectly articulated cry of mixed pain and pleasure."
    click_on "Submit"

    expect( page ).to have_content "Save Successful"
    expect( page ).to have_content "Catcher in the Rye"
    expect( page ).to have_content "JD Salinger"

    click_on "Catcher in the Rye"
    expect( page ).to have_content "Fiction"
    expect( page ).to have_content "Anyone who has read J.D. Salinger's New Yorker stories ? particularly A Perfect Day for Bananafish, Uncle Wiggily in Connecticut, The Laughing Man, and For Esme ? With Love and Squalor, will not be surprised by the fact that his first novel is fully of children. The hero-narrator of THE CATCHER IN THE RYE is an ancient child of sixteen, a native New Yorker named Holden Caulfield. Through circumstances that tend to preclude adult, secondhand description, he leaves his prep school in Pennsylvania and goes underground in New York City for three days. The boy himself is at once too simple and too complex for us to make any final comment about him or his story. Perhaps the safest thing we can say about Holden is that he was born in the world not just strongly attracted to beauty but, almost, hopelessly impaled on it. There are many voices in this novel: children's voices, adult voices, underground voices-but Holden's voice is the most eloquent of all. Transcending his own vernacular, yet remaining marvelously faithful to it, he issues a perfectly articulated cry of mixed pain and pleasure."
  end

  scenario "user creates book with just required information" do
    all_books = FactoryGirl.create_list(:book, 10)
    visit books_path

    click_on "Add new book"
    fill_in "Title", with: "Into the Wild"
    fill_in "Author", with: "John Krakauer"
    fill_in "Year", with: "1990"
    click_on "Submit"

    expect( page ).to have_content "Save Successful"
    expect( page ).to have_content "John Krakauer"
    expect( page ).to have_content "1990"
  end

  scenario "save fails without title" do
    all_books = FactoryGirl.create_list(:book, 10)
    visit books_path

    click_on "Add new book"
    fill_in "Author", with: "John Krakauer"
    fill_in "Year", with: "1990"
    click_on "Submit"

    expect( page ).to have_content "Save Failed"
    expect( page ).to have_content "can't be blank"
  end

  scenario "save fails without author" do
    all_books = FactoryGirl.create_list(:book, 10)
    visit books_path

    click_on "Add new book"
    fill_in "Title", with: "Into the Wild"
    fill_in "Year", with: "1990"
    click_on "Submit"

    expect( page ).to have_content "Save Failed"
    expect( page ).to have_content "can't be blank"
  end

    scenario "save fails without year" do
    all_books = FactoryGirl.create_list(:book, 10)
    visit books_path

    click_on "Add new book"
    fill_in "Title", with: "Into the Wild"
    fill_in "Author", with: "John Krakauer"
    click_on "Submit"

    expect( page ).to have_content "Save Failed"
    expect( page ).to have_content "can't be blank"
  end

end

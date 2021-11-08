require 'rails_helper'

describe "New author page", type: :feature do
  let(:first_name) { 'Alan' }
  let(:last_name) { 'Turing' }
  let(:homepage) { 'http://wikipedia.de/Alan_Turing' }

  before do
    visit new_author_path
  end

  it "should display the title" do
    expect(page).to have_text("Create Author")
  end

  it "should have text inputs for an author's first name, last name, and homepage" do
    expect(page).to have_field('author[first_name]')
    expect(page).to have_field('author[last_name]')
    expect(page).to have_field('author[homepage]')
  end

  it "should create an author when input is valid" do
    page.fill_in 'author[first_name]', with: first_name
    page.fill_in 'author[last_name]', with: last_name
    page.fill_in 'author[homepage]', with: homepage

    find('input[type="submit"]').click

    expect(Author.exists?(first_name: first_name, last_name: last_name, homepage: homepage))
  end

  it "should display error message when input is invalid" do
    page.fill_in 'author[first_name]', with: first_name
    page.fill_in 'author[last_name]', with: ''
    page.fill_in 'author[homepage]', with: homepage

    find('input[type="submit"]').click

    expect(page).to have_text("Last name can't be blank")
  end
end

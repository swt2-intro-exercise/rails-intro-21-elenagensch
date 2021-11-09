require 'rails_helper'

describe "New paper page", type: :feature do
  let(:title) { 'COMPUTING MACHINERY AND INTELLIGENCE' }
  let(:venue) { 'Mind 49: 433-460' }
  let(:year) { 1950 }

  before do
    visit new_paper_path
  end

  it "should display the title" do
    expect(page).to have_text("New Paper")
  end

  it "should have text inputs for an author's first name, last name, and homepage" do
    expect(page).to have_field('paper[title]')
    expect(page).to have_field('paper[venue]')
    expect(page).to have_field('paper[year]')
  end

  it "should create an author when input is valid" do
    page.fill_in 'paper[title]', with: title
    page.fill_in 'paper[venue]', with: venue
    page.fill_in 'paper[year]', with: year

    find('input[type="submit"]').click

    expect(Paper.exists?(title: title, venue: venue, year: year))
  end

  it "should display error message when input is invalid" do
    page.fill_in 'paper[title]', with: ''
    page.fill_in 'paper[venue]', with: venue
    page.fill_in 'paper[year]', with: year

    find('input[type="submit"]').click

    expect(page).to have_text("can't be blank")
  end
end
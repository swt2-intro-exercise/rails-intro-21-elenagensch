require 'rails_helper'

describe "New author page", type: :feature do
  before do
    visit new_author_path
  end

  it "shows title" do
    expect(page).to have_text("Create Author")
  end

  it "should have text inputs for an author's first name, last name, and homepage" do
    expect(page).to have_field('author[first_name]')
    expect(page).to have_field('author[last_name]')
    expect(page).to have_field('author[homepage]')
  end
end



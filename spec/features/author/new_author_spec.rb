require 'rails_helper'

describe "New author page", type: :feature do
  it "shows title" do
    visit new_author_path
    expect(page).to have_text("Create Author")
  end
end



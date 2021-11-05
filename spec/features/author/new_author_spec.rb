require 'rails_helper'

describe "New author page", type: :feature do
  it "should display New Author" do
    visit new_author_path
    expect(page).to have_text("New Author")
  end
end


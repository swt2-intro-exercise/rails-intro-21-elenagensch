require 'rails_helper'

describe "New author page", type: :feature do
  let(:first_name) { 'Alan' }
  let(:last_name) { 'Turing' }
  let(:homepage) { 'http://wikipedia.de/Alan_Turing' }

  before do
    Author.create(first_name: first_name, last_name: last_name, homepage: homepage)
    visit authors_path
  end

  it "should display details on existing authors" do
    expect(page).to have_text(first_name)
    expect(page).to have_text(last_name)
    expect(page).to have_text(homepage)

    expect(page).to have_css('table')
    expect(page).to have_css('th', text: 'Name')
    expect(page).to have_css('th', text: 'Homepage')
  end

  it "should link to the author's details page" do
    @author = FactoryBot.create :author
    expect(page).to have_link @author.name
  end

  it "should link to the New Author page" do
    expect(page).to have_link 'Create Author', href: new_author_path
  end
end

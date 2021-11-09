require 'rails_helper'

describe "Edit paper page", type: :feature do
  let(:first_name) { 'Alan' }
  let(:last_name) { 'Turing' }
  let(:homepage) { 'http://wikipedia.de/Alan_Turing' }

  let(:author) do
    create :author,
           first_name: first_name,
           last_name: last_name,
           homepage: homepage
  end

  let(:first_name) { 'Smilla' }
  let(:last_name) { 'Fox' }
  let(:homepage) { 'http://wikipedia.de/Smililah' }

  let(:author2) do
    create :author,
           first_name: first_name,
           last_name: last_name,
           homepage: homepage
  end

  let(:title) { 'COMPUTING MACHINERY AND INTELLIGENCE' }
  let(:venue) { 'Mind 49: 433-460' }
  let(:year) { 1950 }

  let(:paper) do
    create :paper,
           title: title,
           venue: venue,
           year: year,
           authors: [author]
  end

  before do
    visit edit_paper_path(paper)
  end

  it "should display the title" do
    expect(page).to have_text("Editing Paper")
  end

  it "should have text inputs for an author's first name, last name, and homepage" do
    expect(page).to have_field('paper[title]')
    expect(page).to have_field('paper[venue]')
    expect(page).to have_field('paper[year]')
    expect(page).to have_field('paper[author_ids][]')
  end
end

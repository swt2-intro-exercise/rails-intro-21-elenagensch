require 'rails_helper'

describe "Paper page", type: :feature do
  let(:first_name) { 'Alan' }
  let(:last_name) { 'Turing' }
  let(:homepage) { 'http://wikipedia.de/Alan_Turing' }

  let(:author) do
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
    visit paper_path(paper)
  end

  it 'should display details on paper' do
    expect(page).to have_text(paper.title)
    expect(page).to have_text(paper.venue)
    expect(page).to have_text(paper.year)
  end

  it "'should display author's name" do
    expect(page).to have_text(author.name)
  end
end
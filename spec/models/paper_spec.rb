require 'rails_helper'

RSpec.describe Paper, type: :model do
  let(:title) { 'COMPUTING MACHINERY AND INTELLIGENCE' }
  let(:venue) { 'Mind 49: 433-460' }
  let(:year) { 1950 }

  let(:paper) do
    create :paper,
           title: title,
           venue: venue,
           year: year
  end

  it 'should create paper' do
    expect(paper.title).to eq(title)
    expect(paper.venue).to eq(venue)
    expect(paper.year).to eq(year)
  end
end

require 'rails_helper'

RSpec.describe Author, type: :model do
  let(:author) do
    create :author,
           first_name: 'Ian',
           last_name: 'Turing',
           homepage: 'http://wikipedia.de/Alan_Turing'
  end

  it 'creates author' do
    expect(author.first_name).to eq('Ian')
    expect(author.last_name).to eq('Turing')
    expect(author.homepage).to eq('http://wikipedia.de/Alan_Turing')
  end

  it 'has correct full name' do
    expect(author.name) .to eq('Ian Turing')
  end
end

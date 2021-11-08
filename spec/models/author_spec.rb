require 'rails_helper'

RSpec.describe Author, type: :model do
  let(:first_name) { 'Alan' }
  let(:last_name) { 'Turing' }
  let(:homepage) { 'http://wikipedia.de/Alan_Turing' }

  let(:author) do
    create :author,
           first_name: first_name,
           last_name: last_name,
           homepage: homepage
  end

  it 'should create author' do
    expect(author.first_name).to eq(first_name)
    expect(author.last_name).to eq(last_name)
    expect(author.homepage).to eq(homepage)
  end

  it 'should return full name' do
    expect(author.name).to eq("#{first_name} #{last_name}")
  end

  it 'should not accept empty last name' do
    @author = Author.create(first_name: first_name, last_name: '', homepage: homepage)
    expect(@author).to_not be_valid
  end
end

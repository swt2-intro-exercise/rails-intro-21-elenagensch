require 'rails_helper'

RSpec.describe "NewAuthors", type: :request do
  describe "GET /edit" do
    let(:first_name) { 'Alan' }
    let(:last_name) { 'Turing' }
    let(:homepage) { 'http://wikipedia.de/Alan_Turing' }

    let(:author) do
      create :author,
             first_name: first_name,
             last_name: last_name,
             homepage: homepage
    end

    let(:action) { -> {get edit_author_path(author)}}

    it "returns http success" do
      action.call
      expect(response).to have_http_status(:success)
    end
  end

end

require 'rails_helper'

RSpec.describe "NewAuthors", type: :request do
  describe "GET /index" do
    let(:action) { -> {get "/authors/new"}}

    it "returns http success" do
      action.call
      expect(response).to have_http_status(:success)
    end
  end

end

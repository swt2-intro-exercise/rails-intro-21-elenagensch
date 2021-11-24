require 'rails_helper'

RSpec.describe "Authors", type: :request do
  describe "GET /index" do
    let(:action) { -> {get "/authors"}}

    it "returns http success" do
      action.call
      expect(response).to have_http_status(:success)
    end
  end

end

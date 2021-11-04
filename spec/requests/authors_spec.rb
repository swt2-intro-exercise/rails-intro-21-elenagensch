require 'rails_helper'

RSpec.describe "Authors", type: :request do
  describe "GET /new" do
    let(:action) { -> {get "/new_author"}}
    it "returns http success" do
      action.call
      expect(response).to have_http_status(:success)
    end
  end

end

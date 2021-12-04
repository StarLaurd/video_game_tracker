require "rails_helper"

RSpec.describe "ratings#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/ratings/#{rating.id}", params: params
  end

  describe "basic fetch" do
    let!(:rating) { create(:rating) }

    it "works" do
      expect(RatingResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("ratings")
      expect(d.id).to eq(rating.id)
    end
  end
end

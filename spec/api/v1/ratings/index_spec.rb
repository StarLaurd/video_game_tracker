require 'rails_helper'

RSpec.describe "ratings#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/ratings", params: params
  end

  describe 'basic fetch' do
    let!(:rating1) { create(:rating) }
    let!(:rating2) { create(:rating) }

    it 'works' do
      expect(RatingResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['ratings'])
      expect(d.map(&:id)).to match_array([rating1.id, rating2.id])
    end
  end
end

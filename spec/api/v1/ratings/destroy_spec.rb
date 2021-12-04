require 'rails_helper'

RSpec.describe "ratings#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/ratings/#{rating.id}"
  end

  describe 'basic destroy' do
    let!(:rating) { create(:rating) }

    it 'updates the resource' do
      expect(RatingResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Rating.count }.by(-1)
      expect { rating.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end

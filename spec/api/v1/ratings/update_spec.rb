require "rails_helper"

RSpec.describe "ratings#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/ratings/#{rating.id}", payload
  end

  describe "basic update" do
    let!(:rating) { create(:rating) }

    let(:payload) do
      {
        data: {
          id: rating.id.to_s,
          type: "ratings",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(RatingResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { rating.reload.attributes }
    end
  end
end

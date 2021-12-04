require "rails_helper"

RSpec.describe "publishers#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/publishers/#{publisher.id}"
  end

  describe "basic destroy" do
    let!(:publisher) { create(:publisher) }

    it "updates the resource" do
      expect(PublisherResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { Publisher.count }.by(-1)
      expect { publisher.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end

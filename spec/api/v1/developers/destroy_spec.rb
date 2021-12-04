require "rails_helper"

RSpec.describe "developers#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/developers/#{developer.id}"
  end

  describe "basic destroy" do
    let!(:developer) { create(:developer) }

    it "updates the resource" do
      expect(DeveloperResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { Developer.count }.by(-1)
      expect { developer.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end

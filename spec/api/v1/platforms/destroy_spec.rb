require "rails_helper"

RSpec.describe "platforms#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/platforms/#{platform.id}"
  end

  describe "basic destroy" do
    let!(:platform) { create(:platform) }

    it "updates the resource" do
      expect(PlatformResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { Platform.count }.by(-1)
      expect { platform.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end

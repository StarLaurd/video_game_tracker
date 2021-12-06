require "rails_helper"

RSpec.describe "platforms#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/platforms/#{platform.id}", params: params
  end

  describe "basic fetch" do
    let!(:platform) { create(:platform) }

    it "works" do
      expect(PlatformResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("platforms")
      expect(d.id).to eq(platform.id)
    end
  end
end

require "rails_helper"

RSpec.describe "platforms#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/platforms", params: params
  end

  describe "basic fetch" do
    let!(:platform1) { create(:platform) }
    let!(:platform2) { create(:platform) }

    it "works" do
      expect(PlatformResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["platforms"])
      expect(d.map(&:id)).to match_array([platform1.id, platform2.id])
    end
  end
end

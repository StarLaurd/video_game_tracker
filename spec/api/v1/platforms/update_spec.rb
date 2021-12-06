require "rails_helper"

RSpec.describe "platforms#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/platforms/#{platform.id}", payload
  end

  describe "basic update" do
    let!(:platform) { create(:platform) }

    let(:payload) do
      {
        data: {
          id: platform.id.to_s,
          type: "platforms",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(PlatformResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { platform.reload.attributes }
    end
  end
end

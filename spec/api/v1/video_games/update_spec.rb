require "rails_helper"

RSpec.describe "video_games#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/video_games/#{video_game.id}", payload
  end

  describe "basic update" do
    let!(:video_game) { create(:video_game) }

    let(:payload) do
      {
        data: {
          id: video_game.id.to_s,
          type: "video_games",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(VideoGameResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { video_game.reload.attributes }
    end
  end
end

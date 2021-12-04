require 'rails_helper'

RSpec.describe "video_games#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/video_games/#{video_game.id}"
  end

  describe 'basic destroy' do
    let!(:video_game) { create(:video_game) }

    it 'updates the resource' do
      expect(VideoGameResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { VideoGame.count }.by(-1)
      expect { video_game.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end

require 'rails_helper'

RSpec.describe "video_games#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/video_games/#{video_game.id}", params: params
  end

  describe 'basic fetch' do
    let!(:video_game) { create(:video_game) }

    it 'works' do
      expect(VideoGameResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('video_games')
      expect(d.id).to eq(video_game.id)
    end
  end
end

require 'rails_helper'

RSpec.describe "video_games#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/video_games", params: params
  end

  describe 'basic fetch' do
    let!(:video_game1) { create(:video_game) }
    let!(:video_game2) { create(:video_game) }

    it 'works' do
      expect(VideoGameResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['video_games'])
      expect(d.map(&:id)).to match_array([video_game1.id, video_game2.id])
    end
  end
end

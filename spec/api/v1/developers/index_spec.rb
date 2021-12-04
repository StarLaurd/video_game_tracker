require 'rails_helper'

RSpec.describe "developers#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/developers", params: params
  end

  describe 'basic fetch' do
    let!(:developer1) { create(:developer) }
    let!(:developer2) { create(:developer) }

    it 'works' do
      expect(DeveloperResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['developers'])
      expect(d.map(&:id)).to match_array([developer1.id, developer2.id])
    end
  end
end

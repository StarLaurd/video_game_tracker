require 'rails_helper'

RSpec.describe "developers#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/developers/#{developer.id}", params: params
  end

  describe 'basic fetch' do
    let!(:developer) { create(:developer) }

    it 'works' do
      expect(DeveloperResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('developers')
      expect(d.id).to eq(developer.id)
    end
  end
end

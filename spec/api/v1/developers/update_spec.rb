require 'rails_helper'

RSpec.describe "developers#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/developers/#{developer.id}", payload
  end

  describe 'basic update' do
    let!(:developer) { create(:developer) }

    let(:payload) do
      {
        data: {
          id: developer.id.to_s,
          type: 'developers',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(DeveloperResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { developer.reload.attributes }
    end
  end
end

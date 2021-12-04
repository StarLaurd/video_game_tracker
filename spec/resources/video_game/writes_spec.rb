require 'rails_helper'

RSpec.describe VideoGameResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'video_games',
          attributes: { }
        }
      }
    end

    let(:instance) do
      VideoGameResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { VideoGame.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:video_game) { create(:video_game) }

    let(:payload) do
      {
        data: {
          id: video_game.id.to_s,
          type: 'video_games',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      VideoGameResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { video_game.reload.updated_at }
      # .and change { video_game.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:video_game) { create(:video_game) }

    let(:instance) do
      VideoGameResource.find(id: video_game.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { VideoGame.count }.by(-1)
    end
  end
end

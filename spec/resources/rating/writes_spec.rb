require 'rails_helper'

RSpec.describe RatingResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'ratings',
          attributes: { }
        }
      }
    end

    let(:instance) do
      RatingResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Rating.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:rating) { create(:rating) }

    let(:payload) do
      {
        data: {
          id: rating.id.to_s,
          type: 'ratings',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      RatingResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { rating.reload.updated_at }
      # .and change { rating.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:rating) { create(:rating) }

    let(:instance) do
      RatingResource.find(id: rating.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Rating.count }.by(-1)
    end
  end
end

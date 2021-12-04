require 'rails_helper'

RSpec.describe VideoGameResource, type: :resource do
  describe 'serialization' do
    let!(:video_game) { create(:video_game) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(video_game.id)
      expect(data.jsonapi_type).to eq('video_games')
    end
  end

  describe 'filtering' do
    let!(:video_game1) { create(:video_game) }
    let!(:video_game2) { create(:video_game) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: video_game2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([video_game2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:video_game1) { create(:video_game) }
      let!(:video_game2) { create(:video_game) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            video_game1.id,
            video_game2.id
          ])
        end
      end

      context 'when descending' do
        before do
          params[:sort] = '-id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            video_game2.id,
            video_game1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end

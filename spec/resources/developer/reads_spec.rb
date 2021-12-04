require 'rails_helper'

RSpec.describe DeveloperResource, type: :resource do
  describe 'serialization' do
    let!(:developer) { create(:developer) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(developer.id)
      expect(data.jsonapi_type).to eq('developers')
    end
  end

  describe 'filtering' do
    let!(:developer1) { create(:developer) }
    let!(:developer2) { create(:developer) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: developer2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([developer2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:developer1) { create(:developer) }
      let!(:developer2) { create(:developer) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            developer1.id,
            developer2.id
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
            developer2.id,
            developer1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end

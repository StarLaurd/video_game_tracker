require "rails_helper"

RSpec.describe RatingResource, type: :resource do
  describe "serialization" do
    let!(:rating) { create(:rating) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(rating.id)
      expect(data.jsonapi_type).to eq("ratings")
    end
  end

  describe "filtering" do
    let!(:rating1) { create(:rating) }
    let!(:rating2) { create(:rating) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: rating2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([rating2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:rating1) { create(:rating) }
      let!(:rating2) { create(:rating) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      rating1.id,
                                      rating2.id,
                                    ])
        end
      end

      context "when descending" do
        before do
          params[:sort] = "-id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      rating2.id,
                                      rating1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end

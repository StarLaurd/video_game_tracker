require "rails_helper"

RSpec.describe PlatformResource, type: :resource do
  describe "serialization" do
    let!(:platform) { create(:platform) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(platform.id)
      expect(data.jsonapi_type).to eq("platforms")
    end
  end

  describe "filtering" do
    let!(:platform1) { create(:platform) }
    let!(:platform2) { create(:platform) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: platform2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([platform2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:platform1) { create(:platform) }
      let!(:platform2) { create(:platform) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      platform1.id,
                                      platform2.id,
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
                                      platform2.id,
                                      platform1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end

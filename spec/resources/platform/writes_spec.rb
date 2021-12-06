require "rails_helper"

RSpec.describe PlatformResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "platforms",
          attributes: {},
        },
      }
    end

    let(:instance) do
      PlatformResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { Platform.count }.by(1)
    end
  end

  describe "updating" do
    let!(:platform) { create(:platform) }

    let(:payload) do
      {
        data: {
          id: platform.id.to_s,
          type: "platforms",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      PlatformResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { platform.reload.updated_at }
      # .and change { platform.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:platform) { create(:platform) }

    let(:instance) do
      PlatformResource.find(id: platform.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { Platform.count }.by(-1)
    end
  end
end

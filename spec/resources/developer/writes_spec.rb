require "rails_helper"

RSpec.describe DeveloperResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "developers",
          attributes: {},
        },
      }
    end

    let(:instance) do
      DeveloperResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { Developer.count }.by(1)
    end
  end

  describe "updating" do
    let!(:developer) { create(:developer) }

    let(:payload) do
      {
        data: {
          id: developer.id.to_s,
          type: "developers",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      DeveloperResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { developer.reload.updated_at }
      # .and change { developer.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:developer) { create(:developer) }

    let(:instance) do
      DeveloperResource.find(id: developer.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { Developer.count }.by(-1)
    end
  end
end

require "rails_helper"

RSpec.describe PublisherResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "publishers",
          attributes: {},
        },
      }
    end

    let(:instance) do
      PublisherResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { Publisher.count }.by(1)
    end
  end

  describe "updating" do
    let!(:publisher) { create(:publisher) }

    let(:payload) do
      {
        data: {
          id: publisher.id.to_s,
          type: "publishers",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      PublisherResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { publisher.reload.updated_at }
      # .and change { publisher.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:publisher) { create(:publisher) }

    let(:instance) do
      PublisherResource.find(id: publisher.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { Publisher.count }.by(-1)
    end
  end
end

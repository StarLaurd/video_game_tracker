require "rails_helper"

RSpec.describe User, type: :model do
  describe "Direct Associations" do
    it { should have_many(:notes) }

    it { should have_many(:ratings) }

    it { should have_many(:statuses) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end

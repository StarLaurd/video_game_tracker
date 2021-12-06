require "rails_helper"

RSpec.describe Rating, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:platform) }

    it { should belong_to(:user) }

    it { should belong_to(:game) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end

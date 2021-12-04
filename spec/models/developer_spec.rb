require "rails_helper"

RSpec.describe Developer, type: :model do
  describe "Direct Associations" do
    it { should have_many(:video_games) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end

require "rails_helper"

RSpec.describe Platform, type: :model do
  describe "Direct Associations" do
    it { should have_many(:ratings) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end

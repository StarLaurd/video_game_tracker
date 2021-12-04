require 'rails_helper'

RSpec.describe VideoGame, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:notes) }

    it { should have_many(:statuses) }

    it { should have_many(:ratings) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end

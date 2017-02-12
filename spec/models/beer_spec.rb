require 'rails_helper'

RSpec.describe Beer, type: :model do
  it "is created if name and style set right" do
    beer = Beer.create name:"beer", style:"IPA"
    expect(beer.name).to eq("beer")
    expect(beer.style).to eq("IPA")
    expect(Beer.count).to eq(1)
  end

  describe "is not created if" do

    it "no name" do
      beer = Beer.create style:"IPA"
      expect(Beer.count).to eq(0)
    end

    it "no style" do
      beer = Beer.create name:"beer"
      expect(Beer.count).to eq(0)
    end
  
  end
end

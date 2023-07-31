require './lib/visitor'

RSpec.describe Visitor do
  describe "#initialize" do
    it "exists" do
      visitor1 = Visitor.new('Bruce', 54, '$10')

      expect(visitor1).to be_a(Visitor)
    end

    it "has readable attributes" do
      visitor1 = Visitor.new('Bruce', 54, '$10')
      
      expect(visitor1.name).to eq("Bruce")
      expect(visitor1.height).to eq(54)
      expect(visitor1.spending_money).to eq(10)
    end
  end

  describe "#add_preference" do
    it "returns an empty array of preferences to start" do
      visitor1 = Visitor.new('Bruce', 54, '$10')
      
      expect(visitor1.preferences).to eq([])
    end

    it "can add a preference to the list and return the list" do
      visitor1 = Visitor.new('Bruce', 54, '$10')
      
      visitor1.add_preference(:gentle)
      visitor1.add_preference(:thrilling)

      expect(visitor1.preferences).to eq([:gentle, :thrilling])
    end
  end

  describe "#tall_enough?" do
    it "can check if a visitor is tall enough to ride given the height requirement" do
      visitor1 = Visitor.new('Bruce', 54, '$10')
      visitor2 = Visitor.new('Tucker', 36, '$5')
      visitor3 = Visitor.new('Penny', 64, '$15')

      expect(visitor1.tall_enough?(54)).to eq(true)
      expect(visitor2.tall_enough?(54)).to eq(false)
      expect(visitor3.tall_enough?(54)).to eq(true)
      expect(visitor1.tall_enough?(64)).to eq(false)
    end
  end
end
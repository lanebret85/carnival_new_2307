require "./lib/carnival"
require "./lib/ride"
require "./lib/visitor"

RSpec.describe Carnival do
  describe "#initialize" do
    it "exists" do
      cool_carnival = Carnival.new(10)

      expect(cool_carnival).to be_a(Carnival)
    end
    
    it "has readable attributes" do
      cool_carnival = Carnival.new(10)

      expect(cool_carnival.duration).to eq(10)
    end
  end

  describe "#add_ride" do
    it "returns an empty array list to start" do
      cool_carnival = Carnival.new(10)

      expect(cool_carnival.rides).to eq([])
    end

    it "can add a ride to its list of rides and return the list" do
      cool_carnival = Carnival.new(10)

      thunderstruck = Ride.new({ name: 'Thunderstruck', min_height: 46, admission_fee: 2, excitement: :thrilling })
      lightning_bolt = Ride.new({ name: 'Lightning Bolt', min_height: 54, admission_fee: 5, excitement: :thrilling })
      chill_vibes = Ride.new({ name: 'Chill Vibes', min_height: 24, admission_fee: 1, excitement: :gentle })

      cool_carnival.add_ride(thunderstruck)
      cool_carnival.add_ride(lightning_bolt)
      cool_carnival.add_ride(chill_vibes)

      expect(cool_carnival.rides).to eq([thunderstruck, lightning_bolt, chill_vibes])
    end
  end

  describe "#most_popular_ride" do
    it "can count the number of times someone rides a ride and return the most-ridden ride" do
      cool_carnival = Carnival.new(10)

      thunderstruck = Ride.new({ name: 'Thunderstruck', min_height: 46, admission_fee: 2, excitement: :thrilling })
      lightning_bolt = Ride.new({ name: 'Lightning Bolt', min_height: 54, admission_fee: 5, excitement: :thrilling })
      chill_vibes = Ride.new({ name: 'Chill Vibes', min_height: 24, admission_fee: 1, excitement: :gentle })

      cool_carnival.add_ride(thunderstruck)
      cool_carnival.add_ride(lightning_bolt)
      cool_carnival.add_ride(chill_vibes)

      bruce = Visitor.new('Bruce', 54, '$50')
      tucker = Visitor.new('Tucker', 36, '$50')
      penny = Visitor.new('Penny', 64, '$50')

      bruce.add_preference(:gentle)
      bruce.add_preference(:thrilling)
      tucker.add_preference(:gentle)
      tucker.add_preference(:thrilling)
      penny.add_preference(:gentle)
      penny.add_preference(:thrilling)

      thunderstruck.board_rider(bruce)
      thunderstruck.board_rider(penny)
      thunderstruck.board_rider(bruce)
      thunderstruck.board_rider(penny)
      thunderstruck.board_rider(bruce)

      lightning_bolt.board_rider(penny)
      lightning_bolt.board_rider(bruce)
      lightning_bolt.board_rider(penny)
      lightning_bolt.board_rider(bruce)

      chill_vibes.board_rider(tucker)
      chill_vibes.board_rider(tucker)
      chill_vibes.board_rider(bruce)

      expect(cool_carnival.most_popular_ride).to eq(thunderstruck)
    end
  end

  describe "#most_profitable_ride" do
    it "can total the revenue amounts for each ride and return the highest earning ride" do
      cool_carnival = Carnival.new(10)

      thunderstruck = Ride.new({ name: 'Thunderstruck', min_height: 46, admission_fee: 2, excitement: :thrilling })
      lightning_bolt = Ride.new({ name: 'Lightning Bolt', min_height: 54, admission_fee: 5, excitement: :thrilling })
      chill_vibes = Ride.new({ name: 'Chill Vibes', min_height: 24, admission_fee: 1, excitement: :gentle })

      cool_carnival.add_ride(thunderstruck)
      cool_carnival.add_ride(lightning_bolt)
      cool_carnival.add_ride(chill_vibes)

      bruce = Visitor.new('Bruce', 54, '$50')
      tucker = Visitor.new('Tucker', 36, '$50')
      penny = Visitor.new('Penny', 64, '$50')

      bruce.add_preference(:gentle)
      bruce.add_preference(:thrilling)
      tucker.add_preference(:gentle)
      tucker.add_preference(:thrilling)
      penny.add_preference(:gentle)
      penny.add_preference(:thrilling)

      thunderstruck.board_rider(bruce)
      thunderstruck.board_rider(penny)
      thunderstruck.board_rider(bruce)
      thunderstruck.board_rider(penny)
      thunderstruck.board_rider(bruce)

      lightning_bolt.board_rider(penny)
      lightning_bolt.board_rider(bruce)
      lightning_bolt.board_rider(penny)
      lightning_bolt.board_rider(bruce)

      chill_vibes.board_rider(tucker)
      chill_vibes.board_rider(tucker)
      chill_vibes.board_rider(bruce)

      expect(cool_carnival.most_profitable_ride).to eq(lightning_bolt)
    end
  end
end
class Carnival
  attr_reader :duration,
              :rides

  def initialize(duration)
    @duration = duration
    @rides = []
  end

  def add_ride(ride)
    @rides << ride
  end

  def most_popular_ride
    total_rides = Hash.new(0)
    rides.each do |ride|
      total_rides[ride] = ride.rider_log.values.sum
    end
    total_rides.key(total_rides.values.max)
  end
end
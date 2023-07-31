class Carnival
  attr_reader :duration,
              :rides

  def initialize(duration)
    @duration = duration
    @rides = []
    @total_rides = Hash.new(0)
    @ride_revenues = Hash.new(0)
  end

  def add_ride(ride)
    @rides << ride
  end

  def most_popular_ride
    @rides.each do |ride|
      @total_rides[ride] = ride.rider_log.values.sum
    end
    @total_rides.key(@total_rides.values.max)
  end

  def most_profitable_ride
    @rides.each do |ride|
      @ride_revenues[ride] = ride.total_revenue
    end
    @ride_revenues.key(@ride_revenues.values.max)
  end

  def total_revenue
    @rides.each do |ride|
      @ride_revenues[ride] = ride.total_revenue
    end
    @ride_revenues.values.sum
  end
end
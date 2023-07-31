class Ride
  attr_reader :name,
              :min_height,
              :admission_fee,
              :excitement

  def initialize(ride_details)
    @name = ride_details[:name]
    @min_height = ride_details[:min_height]
    @admission_fee = ride_details[:admission_fee]
    @excitement = ride_details[:excitement]
  end
end
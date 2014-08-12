module BikeContainer

	DEFAULT_CAPACITY = 10


	def bikes
		@bikes ||= []
	end

	def capacity
		@capacity ||= DEFAULT_CAPACITY
	end

	def capacity=(value)
		@capacity = value
	end

	def bike_count
		bikes.count 
	end

	def dock(bike)
		raise "this is not a bike" unless bike.is_a? Bike 
		raise "There is no more room for bikes" if full?
		bikes << bike unless bikes.include?(bike)
	end

	def release bike
		raise "this is not a bike" unless bike.is_a? Bike
		raise "bike not docked" unless bikes.delete(bike)
	end

	def full?
		bike_count == capacity 
	end

	def available_bikes
		bikes.reject {|bike| bike.broken?}
	end

	def empty?
		return false if bike_count > 0
		return true if bike_count == 0
	end

end

	


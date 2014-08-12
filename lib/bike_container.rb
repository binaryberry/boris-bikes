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
		raise "There is no more room for bikes" if full?
		bikes << bike 
	end

	def release(bike)
		
		if  bike.class != Bike 
			if bike == nil
				raise "no bike specified"
			else
				raise "this is not a bike"
			end
		elsif bikes.include?(bike) == true				
			bikes.delete(bike) 
		else 
			raise "bike not docked"
		end
	end

	def full?
		bike_count == capacity 
	end

	def available_bikes
		bikes.reject {|bike| bike.broken?}
	end
end

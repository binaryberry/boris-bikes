#load BikeContainer
require_relative 'bike_container'

class Garage
	#this gives us all the methods that used to be in this class
	include BikeContainer

	def initialize(options = {})
		#self.capacity is calling the capacity=() method
		#(note the equals sign) defined in BikeContainer
		# capacity (the second argument to fetch()) is calling
		# the capacity() method in BikeContainer
		self.capacity = options.fetch(:capacity, capacity)
	end

	def dock(bike)
	bike.fix!
	super
	end

end
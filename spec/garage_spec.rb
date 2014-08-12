require 'garage'
require 'bike'

describe Garage  do 
	it "should fix a bike before docking" do
		bike = Bike.new
		bike.break!
		garage = Garage.new
		garage.dock(bike)
		expect(bike.broken?).to be false
	end
end
require './lib/bike_container'


class ContainerHolder; include BikeContainer; end

describe BikeContainer do 
	let(:bike) { double :bike, broken?: false }
	let(:broken_bike) { double :bike, broken?: true}

	let(:holder) { ContainerHolder.new }


	it "should accept a bike" do
		#We expect the holder to have 0 bikes
		expect(holder.bike_count).to eq(0)
		#let's doch a bike into the holder
		holder.dock(bike)
		# now we expect the holder to have 1 bike
		expect(holder.bike_count).to eq(1)
	end

	it "should release a bike" do
		holder.dock(bike)
		holder.release(bike)
		expect(holder.bike_count).to eq(0)
	end

	it "should know when it's full" do
		expect(holder).not_to be_full
		fill_holder holder
		expect(holder).to be_full
	end

	it "should not accept a bike if it's full" do
		fill_holder holder 
		expect( lambda { holder.dock(bike) }).to raise_error(RuntimeError)
	end

	def fill_holder(holder)
		holder.capacity.times { holder.dock(bike)}
	end

	it "should provide the list of available bikes" do
		holder.dock(bike)
		holder.dock(broken_bike)
		expect(holder.available_bikes).to eq([bike])
	end
end
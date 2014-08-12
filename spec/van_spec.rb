require './lib/van.rb'

describe Van do 
	let(:van) { Van.new(:capacity => 123) }


	it "should allow setting default capacity on initialising" do
		expect(van.capacity).to eq(123)
	end
end
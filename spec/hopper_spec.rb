require "spec_helper"
require "hopper.rb"
require "pry"

describe Hopper do 

  let(:arr1) { [4,5,0,3,9,4,10] }
  let(:arr2) { [2,4,0,0,3,1,9] }
  let(:arr3) { [5, 6, 0, 4, 2, 4, 1, 0, 0, 4] }

  it "gives the right answer for sample array arr1" do 
    hopper  = Hopper.new(arr1)
    expect(hopper.find_solution).to eq([0, 4, "out"])
  end

  it "gives the right answer for sample array arr2" do 
    hopper  = Hopper.new(arr2)
    expect(hopper.find_solution).to eq([0, 1, 4, "out"])
  end


  it "gives the right answer for sample array arr3" do 
    hopper  = Hopper.new(arr3)
    expect(hopper.find_solution).to eq([0, 5, 9, "out"])
  end

end

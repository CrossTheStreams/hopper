require "spec_helper"
require "hopper.rb"
require "pry"

describe  "Hopper" do 

  it "is a class" do 
    (Hopper rescue nil).class == Class
  end

  it "gives the right answer for sample array ARR1" do 
    #ARR1 = [4,5,0,3,9,4,10]
    hopper  = Hopper.new(ARR1)
    expect(hopper.find_solution).to eq([0, 4, "out"])
  end

  it "gives the right answer for sample array ARR2" do 
    #ARR2 = [2,4,0,0,3,1,9]
    hopper  = Hopper.new(ARR2)
    expect(hopper.find_solution).to eq([0, 1, 4, "out"])
  end


  it "gives the right answer for sample array ARR3" do 
    #ARR3 = [5, 6, 0, 4, 2, 4, 1, 0, 0, 4] 
    hopper  = Hopper.new(ARR3)
    expect(hopper.find_solution).to eq([0, 5, 9, "out"])
  end

end

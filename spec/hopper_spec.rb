require "hopper.rb"

describe  "Hopper" do 

  it "should be a class" do 
    (Hopper rescue nil).class == Class
  end

end

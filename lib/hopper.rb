require 'pry'
require 'csv'

class Hopper

  def initialize(problem_array)
    @problem_array = problem_array
    @solutions = []
  end

  def find_solution
    raise "Problem can't start with zero!" if @problem_array[0].zero?
    raise "Need a valid problem array" if @problem_array[0].nil?
    hop
    purge_invalid_solutions
    random_valid_solution
  end

  private

  def hop(current_hop=[0])
    hop_start_index = current_hop.last
    next_idx = hop_start_index + @problem_array[hop_start_index] rescue nil
    hops = []
    choice = nil

    # Dont land on zero and break when we're done
    for i in (hop_start_index+1)..next_idx
      if @problem_array[i].nil?
        # We've hit the end of our hopping journey.
        # Collect the hops we've taken.
        print "."
        @solutions << current_hop
        break
      elsif @problem_array[i].zero?
        # Gameover man
        next
      else
        hops << i
      end
    end 
   
    # Recursively traverse possible solutions to find solutions with the minimum hops 
    hops.each do |idx|
      next_hop = current_hop.clone << idx
      hop(next_hop)
    end

  end

  def purge_invalid_solutions
    min_hops = hops_in_solution
    @solutions = @solutions.select {|sol| sol.reduce(:+) == min_hops} 
  end

  def hops_in_solution
    hops_taken = @solutions.map do |solution|
      solution.reduce(:+) || 0
    end
    hops_taken.min || 0
  end

  def random_valid_solution
    solution = @solutions.sample(1).first.clone rescue []
    solution << "out"
  end
 
end

if ARGV[0]
  array = CSV.read(File.expand_path(ARGV[0]))[0].map {|str| str.to_i}
  hopper = Hopper.new(array)
  puts "\nA solution for array: #{hopper.find_solution}"
end


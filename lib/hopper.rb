ARR1 = [4,5,0,3,9,4,10]
ARR2 = [2,4,0,0,3,1,9]
ARR3 = [5, 6, 0, 4, 2, 4, 1, 0, 0, 4] 

class Hopper
  ## cache is a 2D array of 'hops'
  attr_accessor :problem_array
  attr_accessor :solutions
  attr_accessor :current_idx

  def initialize(problem_array)
    self.problem_array = problem_array
  end

  def find_solution
    raise "Problem can't start with zero!" if self.problem_array[0].zero?
    raise "Need a valid problem array" if self.problem_array[0].nil?
    #self.current_idx = 0
    self.solutions = []
    #recursion = Proc.new { |hopper, recurs, hop_start_index| hopper.hop(recurs,hop_start_index) }
    self.hop
    self.purge_invalid_solutions
    self.random_valid_solution
 end

  def hop(current_hop=[0])
    problem = self.problem_array
    hop_start_index = current_hop.last
    next_idx = hop_start_index + problem[hop_start_index] rescue nil
    valid_hops = []
    choice = nil

    # Dont land on zero and break when we're done
    for i in (hop_start_index+1)..next_idx
      if problem[i].nil?
        self.solutions << current_hop
        break
      elsif problem[i].zero?
        next
      else
        valid_hops << i
      end
    end 
   
    # We must traverse possible solutions to find solutions with the minimum hops
   
    valid_hops.each do |idx|
      next_hop = current_hop.clone << idx
      self.hop(next_hop)
    end

  end

  def purge_invalid_solutions
    min_hops = self.hops_in_solution
    self.solutions = self.solutions.select {|sol| sol.reduce(:+) == min_hops} 
  end

  def hops_in_solution
    hops_taken = solutions.map do |solution|
      solution.reduce(:+) || 0
    end
    hops_taken.min || 0
  end

  def random_valid_solution
    solution = self.solutions.sample(1).first.clone rescue []
    solution << "out"
  end
   

end


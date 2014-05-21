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
    self.current_idx = 0
    self.solutions = []
    recursion = Proc.new { |hopper, recurs| hopper.hop(recurs) }
    self.hop(recursion)
  end

  def hop(recursion=nil)
    problem = self.problem_array
    next_idx = self.current_idx + problem[self.current_idx] rescue nil
    valid_hops = []
    choice = nil

    # Dont land on zero and break when we're done
    for i in (current_idx+1)..next_idx
      if problem[i].nil?
        puts "out"
        choice = "out"
        self.solutions << "out"
        break
      elsif problem[i].zero?
        next
      else
        #valid_hops << i
        valid_hops << [i,problem[i]]
      end
    end 

    return self.solutions if choice == "out"

    #choice = valid_hops.max
   
    # We must traverse possible solutions to find solutions with the minimum hops

    
    valid_hops.each do |arr|
      self.solutions.each do |solution| 
        k
      end
    end

    #choice = valid_hops.sort {|a,b| b[1] <=> a[1] }.first[0] if !choice 
    #choice = valid_hops.sort {|a,b| b[0] <=> a[0] }.first[0] if !choice 


    self.solutions << choice
    self.current_idx = choice

    recursion.call(self,recursion) if recursion
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
   

end


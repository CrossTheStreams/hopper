ARR1 = [4,5,0,3,9,4,10]
ARR2 = [2,4,0,0,3,1,9]
ARR3 = [5, 6, 0, 4, 2, 4, 1, 0, 0, 4] 

class Hopper
  ## cache is a 2D array of 'hops'
  attr_accessor :problem_array
  attr_accessor :solution
  attr_accessor :current_idx

  def initialize(problem_array)
    self.problem_array = problem_array
  end

  def find_solution 
    raise "Problem can't start with zero!" if self.problem_array[0].zero?
    raise "Need a valid problem array" if self.problem_array[0].nil?
    self.current_idx = 0
    self.solution = [0] 
    recursion = Proc.new { |hopper, recurs| hopper.hop(recurs) }
    self.hop(recursion)
  end

  def hop(recursion=nil)
    problem = self.problem_array
    next_idx = current_idx + problem[self.current_idx] rescue nil
    choices = []
    choice = nil

    for i in current_idx..next_idx
      if problem[i].nil?
        puts "out"
        choice = "out"
        self.solution << "out"
        break
      elsif problem[i].zero?
        next
      else
        choices << i
      end
    end

    return self.solution if choice == "out"
    
    choice = choices.max

    #self.cache[current_idx] = [] if self.cache[current_idx].nil? 
    self.solution << choice
    self.current_idx = choice
    recursion.call(self,recursion) if recursion
    self.solution
  end
   

end


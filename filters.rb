
# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

#Task 2 Experienced candidate
def experienced?(candidate)
  unless candidate.has_keys?(:years_of_experience)
    raise ArgumentError, 'candidate must have a :years_of_experience key'
  end
  candidate[:years_of_experience] >= 2
end  

#Task 3 Finding by id
def find(id)
  raise '@candidates must be an Array' if @candidates.nil?
  @candidates.detect {|candidate| candidate[:id] == id}
end
 

# Task 4 Qualified Candidate

def high_github(candidate)
  raise ':github_points must be an integer' unless @candidate[:github_points].is_an_int?
  candidate[:github_points] >= 100
end

def know_language_ruby(candidate)
  candidate[:languages].include?("Ruby")
end

def know_language_python(candidate)
  candidate[:languages].include?("Python")
end

def applied_recently(candidate)
  candidate[:date_applied] >= 15.days.ago.to_date
end

def age_required(candidate)
  candidate[:age] >= 17
end

def qualified_candidates(candidates)
  candidates.select {|candidate| experienced?(candidate) && high_github(candidate) && (know_language_python(candidate) || know_language_ruby(candidate)) && applied_recently(candidate) && age_required(candidate)}
end


# Task 5 Sort on Experience and Points
def ordered_by_qualifications(candidates)
  candidates.sort {|candidate1, candidate2| candidate1[:years_of_experience] == candidate2[:years_of_experience]? candidate2[:github_points] <=> candidate1[:github_points] : candidate2[:years_of_experience] <=> candidate1[:years_of_experience]}
end

# Task 6 REPL

def find_1
  if @candidates.detect {|candidate| candidate[:id] == 1} 
      puts candidate 
  else
      puts "This candidate does not exist"
  end
end

def print_all
  @candidates.each do |candidate|
    candidate.each do |key, value| 
      puts "#{key} => #{value}"
    end
  end
end

def qualified
  sorted = ordered_by_qualifications(qualified_candidates(@candidates))
  sorted.each do |candidate|
    candidate.each do |key, value|
    puts "#{key} => #{value}"
    end
  end
end


def menu
  status = true
  while status == true
    print "Please select one of the following commands: [find 1] [all] [qualified] [quit]"
    input = gets.chomp.to_s

    case input
      when "find 1" then find_1
      when "all" then print_all
      when "qualified" then qualified
      when "quit" then status = false
      puts "Now you've exit the menu!"
      else puts "I don't understand your command!"
    end
  end
end

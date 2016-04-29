
# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

#Task 2 Experienced candidate
def experienced?(candidate)
  candidate[:years_of_experience] >= 2
end  

#Task 3 Finding by id
def find(id)
  @candidates.detect {|candidate| candidate[:id] == id}
end
 

# Task 4 Qualified Candidate

def high_github(candidate)
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

# Task 6 REPL based menu


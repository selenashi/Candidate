# This is the main entrypoint into the program
# It requires the other files/gems that it needs

require 'pry'
require './candidates'
require './filters'

## Your test code can go here


pp experienced?(@candidates[1])

pp find(10)

pp qualified_candidates(@candidates)

pp ordered_by_qualifications(@candidates)
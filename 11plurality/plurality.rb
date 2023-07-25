# Global variable (do not touch this)
$candidates = []

# Method definitions. To be completed by you:
def get_list(prompt, min, max)
  # your code here
end

def get_positive(prompt)
  # your code here
end

def valid_vote?(name)
  # your code here
end

def print_winner
  # your code here
end

# The program starts here. Just uncomment the code when needed

# names = get_list("Candidates names: ", 1, 9)

# names.each do |name|
#   candidate = { "name" => name, "votes" => 0 }
#   $candidates.push(candidate)
# end

# voters_count = get_positive("Number of voters: ")

# puts "-" * 20

# (1..voters_count).each do |i|
#   print "Voter #{i}: "
#   name = gets.chomp

#   until valid_vote?(name)
#     puts "Invalid vote"
#     print "Voter #{i}: "
#     name = gets.chomp
#   end
# end

# puts "-" * 20

# print_winner

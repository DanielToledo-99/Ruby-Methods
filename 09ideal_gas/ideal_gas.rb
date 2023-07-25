# Global variable (do not touch this)
$candidates = []

# Method definitions. To be completed by you:
def get_list(prompt, min, max)
  loop do
    print prompt
    names = gets.chomp.split
    return names if names.size.between?(min, max)

    puts "The list should have between #{min} and #{max} elements"
  end
end

def get_positive(prompt)
  loop do
    print prompt
    number = gets.chomp.to_i
    return number if number.positive?

    puts "Number should be positive"
  end
end

def valid_vote?(name)
  candidate = $candidates.find { |c| c["name"] == name }
  return false unless candidate

  candidate["votes"] += 1
  true
end

def print_winner
  max_votes = $candidates.map { |candidate| candidate["votes"] }.max

  winners = $candidates.select { |candidate| candidate["votes"] == max_votes }
  names = winners.map { |winner| winner["name"] }
  puts "Winners: #{names.join(', ')}"
end

# The program starts here. Just uncomment the code when needed

names = get_list("Candidates names: ", 1, 9)

names.each do |name|
  candidate = { "name" => name, "votes" => 0 }
  $candidates.push(candidate)
end

voters_count = get_positive("Number of voters: ")

puts "-" * 20

(1..voters_count).each do |i|
  print "Voter #{i}: "
  name = gets.chomp

  until valid_vote?(name)
    puts "Invalid vote"
    print "Voter #{i}: "
    name = gets.chomp
  end
end

puts "-" * 20

print_winner
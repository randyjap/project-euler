# The following iterative sequence is defined for the set of positive integers:

# n → n/2 (n is even)
# n → 3n + 1 (n is odd)

# Using the rule above and starting with 13, we generate the following sequence:
# 13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1

# It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.

# Which starting number, under one million, produces the longest chain?

# NOTE: Once the chain starts the terms are allowed to go above one million.

# Answer: 837799

greatest_yielding_number = nil
greatest_counter = 0
n = 2
while n < 1_000_000
  number = n
  counter = 0
  while number != 1
    counter += 1
    number.odd? ? number = 3 * number + 1 : number = number / 2
  end
  if counter > greatest_counter
    greatest_counter = counter
    greatest_yielding_number = n
  end
  n += 1
end

puts greatest_yielding_number

# real    0m9.786s
# user    0m9.572s
# sys     0m0.204s

########################### Refactored ########################### 

def next_number(n)
  n.even? ? n/2 : 3*n+1
end

count = 2 # offset because first and last items aren't counted
max_count = 0
at_number = 2
known = {}

(2..1_000_000).each do |number|
  start = number
  until known.has_key?(number) || (number = next_number(number)) == 1
    count += 1
  end
  
  if number != 1
    count += known.fetch(number)
  end
  
  known[start] = count
  
  if count > max_count
    max_count = count
    at_number = start
  end
  count = 2
end

puts "Answer: #{at_number}"

# real    0m3.724s
# user    0m3.500s
# sys     0m0.172s
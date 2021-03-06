# The sequence of triangle numbers is generated by adding the natural numbers. So the 7th triangle number would be 1 + 2 + 3 + 4 + 5 + 6 + 7 = 28. The first ten terms would be:

# 1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...

# Let us list the factors of the first seven triangle numbers:

#     1: 1
#     3: 1,3
#     6: 1,2,3,6
#     10: 1,2,5,10
#     15: 1,3,5,15
#     21: 1,3,7,21
#     28: 1,2,4,7,14,28

# We can see that 28 is the first triangle number to have over five divisors.

# What is the value of the first triangle number to have over five hundred divisors?

# Answer: 76576500

require 'prime'

def factors_of(number)
  primes, powers = number.prime_division.transpose
  exponents = powers.map{ |i| (0..i).to_a }
  divisors = exponents.shift.product(*exponents).map do |pow|
    primes.zip(pow).map{|prime, power| prime ** power}.inject(:*)
  end
  divisors.sort
end

def triangle(n)
  counter = 1
  sum = 0
  while counter <= n
    sum += counter
    counter += 1
  end
  sum
end

n = 2
while true
  check = triangle(n)
  break check if factors_of(check).size > 500
  n += 1
end

puts check

# real    0m5.132s
# user    0m4.976s
# sys     0m0.132s
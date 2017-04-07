# A perfect number is a number for which the sum of its proper divisors is exactly equal to the number. For example, the sum of
# the proper divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.

# A number n is called deficient if the sum of its proper divisors is less than n and it is called abundant if this sum exceeds n.

# As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest number that can be written as the sum of two abundant
# numbers is 24. By mathematical analysis, it can be shown that all integers greater than 28123 can be written as the sum of two 
# abundant numbers. However, this upper limit cannot be reduced any further by analysis even though it is known that the greatest 
# number that cannot be expressed as the sum of two abundant numbers is less than this limit.

# Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.

# Answer: 4179871

require 'prime'

def proper_divisors(number)
  primes, powers = number.prime_division.transpose
  exponents = powers.map{ |i| (0..i).to_a }
  divs = exponents.shift.product(*exponents).map do |pow|
    primes.zip(pow).map{|prime, power| prime ** power}.inject(:*)
  end
  divs.pop
  divs.sort
end

def abundant?(n)
  sum = proper_divisors(n).inject(:+)
  sum > n ? true : false
end

abundant_numbers = (12..28213).select { |n| abundant?(n) }

sums = []
abundant_numbers.each do |x|
  abundant_numbers.each do |y|
    sum = x + y
    sums << sum unless sum > 28213
  end
end
sums.uniq!

puts (1..28213).reject { |n| sums.include? n }.inject(:+)

# real    0m8.610s
# user    0m8.360s
# sys     0m0.240s
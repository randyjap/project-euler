# 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

# What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
# Answer: 232792560

n = 0
continue = true
while continue == true
  continue = false
  n += 20
  (1..20).to_a.each do |i|
    continue = true if n % i != 0
  end
  break if continue == false
end

puts n

# real    0m35.182s
# user    0m34.768s
# sys     0m0.148s

########################### Refactored ###########################


def divisible_by_1to20?(number)
  divisors = [19, 18, 17, 16, 15, 14, 13, 12, 11] #All numbers below must be divisors if these are.  20 anyway because we check in 60s (3 * 20) below
  divisors.each do |n|
    return false if (number % n != 0)
  end
  return true
end

number = 60
until divisible_by_1to20?(number)
  number += 60
end

puts number

# real    0m1.777s
# user    0m1.628s
# sys     0m0.128s

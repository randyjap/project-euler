# Let d(n) be defined as the sum of proper divisors of n (numbers less than n which divide evenly into n).
# If d(a) = b and d(b) = a, where a ≠ b, then a and b are an amicable pair and each of a and b are called amicable numbers.

# For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.

# Evaluate the sum of all the amicable numbers under 10000.

# Answer: 31626

def divisors_sum(number)
  sum = 0
  n = 1
  while n < number
    sum += n if number % n == 0
    n += 1
  end
  sum
end

sum = 0
n = 1
while n < 10000
  if divisors_sum(divisors_sum(n)) == n && divisors_sum(n) != n && divisors_sum(n) < 10000
    sum += n
    # sum += divisors_sum(n) # since you will come across the twin anyway
  end
  n += 1
end
puts sum

# real    0m4.471s
# user    0m4.308s
# sys     0m0.140s

########################### Refactored ###########################

def amicable_pair?(a, b)
  return false if a == b
  return divisors_sum(a) == b && divisors_sum(b) == a ? true : false
end

def divisors_sum(number)
  sum = 0
  (2..Math.sqrt(number)).each do |n|
    sum += n + number / n if number % n == 0
  end
  sum += 1

  if Math.sqrt(number).integer? # in case it's a perfect square
    sum -= Math.sqrt(number)
  end
  
  return sum 
end

sum = 0
n = 1
while n < 10000
  if divisors_sum(divisors_sum(n)) == n && divisors_sum(n) != n && divisors_sum(n) < 10000
    sum += n # don't include sum += divisors_sum(n) # since you will come across the twin anyway
  end
  n += 1
end

puts sum

# real    0m0.352s
# user    0m0.252s
# sys     0m0.096s
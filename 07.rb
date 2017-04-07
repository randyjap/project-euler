# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.

# What is the 10 001st prime number?

# Answer: 104743

def prime?(number)
  return false if number < 2
  return true if number == 2
  counter = 3
  while counter < number
    return false if number.even? || number % counter == 0
    counter += 2
  end
  true
end

counter = 1
n = 1
until counter == 10_001
  n += 2
  counter += 1 if prime?(n)
end
puts n

# real    0m16.419s
# user    0m16.116s
# sys     0m0.164s

########################### Refactored ###########################

def prime?(n)
  return false if n == 1
  return true if n < 4
  return false if n % 2 == 0
  return true if n < 9
  return false if n % 3 == 0
  r = Math.sqrt(n).round(1)
  f = 5
  while f <= r
    return false if n % f == 0
    return false if n % (f + 2) == 0
    f += 6
  end
  true
end

n = 1
counter = 1
while true
  counter += 1 if prime?(n)
  break puts n if counter == 10_001
  n += 2
end

# real    0m0.237s
# user    0m0.136s
# sys     0m0.096s
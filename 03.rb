# The prime factors of 13195 are 5, 7, 13 and 29.
# What is the largest prime factor of the number 600851475143 ?

# Answer: 6857

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

def first_prime_factor(number)
  (2..number-1).each do |counter|
    return counter if number % counter == 0 && prime?(counter)
  end
end

number = 600851475143

while true
  prime_factor = first_prime_factor(number)
  number = number / prime_factor
  break if prime?(number)
end

puts number

# real    0m0.142s
# user    0m0.076s
# sys     0m0.064s

########################### Refactored ###########################

n = 600851475143

if n % 2 == 0
  last_factor = 2
  n = n / 2
  while n % 2 == 0
    n = n / 2
  end
else
  last_factor = 1
end

factor = 3
max_factor = Math.sqrt(n)
while n > 1 and factor <= max_factor
  if n % factor == 0
    n = n / factor
    last_factor = factor
    while n % factor == 0
      n = n / factor
    end
    max_factor = Math.sqrt(n)
  end
  factor += 2
end

if n == 1
  puts last_factor
else
  puts n
end

# real    0m0.151s
# user    0m0.056s
# sys     0m0.092s
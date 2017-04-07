# Euler discovered the remarkable quadratic formula:

# n2+n+41

# It turns out that the formula will produce 40 primes for the consecutive integer values 0≤n≤39
# . However, when n=40,402+40+41=40(40+1)+41 is divisible by 41, and certainly when n=41,412+41+41

# is clearly divisible by 41.

# The incredible formula n2−79n+1601
# was discovered, which produces 80 primes for the consecutive values 0≤n≤79

# . The product of the coefficients, −79 and 1601, is −126479.

# Considering quadratics of the form:

#     n2+an+b

# , where |a|<1000 and |b|≤1000

# where |n|
# is the modulus/absolute value of n
# e.g. |11|=11 and |−4|=4

# Find the product of the coefficients, a
# and b, for the quadratic expression that produces the maximum number of primes for consecutive values of n, starting with n=0.

# Answer: -59231

require 'prime'

greatest_number_of_primes = 0
value_of_a = nil
value_of_b = nil

a = -1000
while a < 1000
  b = -1000
  while b <= 1000
    n = 0
    while (n**2 + a * n + b).prime? 
      n += 1
    end
    if n > greatest_number_of_primes
      greatest_number_of_primes = n
      value_of_a = a
      value_of_b = b
    end
    b += 1
  end
  a += 1
end

puts value_of_a * value_of_b

# real    0m1.822s
# user    0m1.692s
# sys     0m0.124s
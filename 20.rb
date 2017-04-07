# n! means n × (n − 1) × ... × 3 × 2 × 1

# For example, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800,
# and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.

# Find the sum of the digits in the number 100!

# Answer: 648

puts (2..100).inject(:*).to_s.chars.map { |x| x.to_i }.inject(:+)

# real    0m0.155s
# user    0m0.072s
# sys     0m0.080s
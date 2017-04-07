# 215 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.

# What is the sum of the digits of the number 2**1000?

# Answer: 1366

puts (2**1000).to_s.split('').map { |x| x.to_i }.inject(:+)

# real    0m0.214s
# user    0m0.084s
# sys     0m0.124s
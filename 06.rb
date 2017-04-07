# The sum of the squares of the first ten natural numbers is,

# 12 + 22 + ... + 102 = 385
# The square of the sum of the first ten natural numbers is,

# (1 + 2 + ... + 10)2 = 552 = 3025
# Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 − 385 = 2640.

# Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.

# Answer: 25164150

summed_squares = (1..100).to_a.map { |i| i*i }.inject(:+)
sum = (1..100).to_a.inject(:+)
squared_sum =  sum * sum
puts squared_sum - summed_squares

# real    0m0.142s
# user    0m0.060s
# sys     0m0.076s

########################### Refactored ###########################

max = 100
sum = max * (max + 1) / 2
sum_squared = (2 * max + 1) * (max + 1) * max / 6
puts sum**2 - sum_squared

# real    0m0.155s
# user    0m0.056s
# sys     0m0.096s
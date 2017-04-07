# If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
# Find the sum of all the multiples of 3 or 5 below 1000.

# Answer 233168

number_1 = 3
number_2 = 5
solution = 0
max = 1000
max.times do |i|
  solution += i if i % number_1 == 0 || i % number_2 == 0
end
puts solution

# real    0m0.259s
# user    0m0.096s
# sys     0m0.120s

########################### Refactored ###########################

def sum_of_divisor_up_to(n, upper_limit = 999)
  p = upper_limit / n
  n * p * (p + 1) / 2
end

puts sum_of_divisor_up_to(3) + sum_of_divisor_up_to(5) - sum_of_divisor_up_to(15)
  
# real    0m0.154s
# user    0m0.072s
# sys     0m0.076s    
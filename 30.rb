# Surprisingly there are only three numbers that can be written as the sum of fourth powers of their digits:

#     1634 = 1^4 + 6^4 + 3^4 + 4^4
#     8208 = 8^4 + 2^4 + 0^4 + 8^4
#     9474 = 9^4 + 4^4 + 7^4 + 4^4

# As 1 = 14 is not a sum it is not included.

# The sum of these numbers is 1634 + 8208 + 9474 = 19316.

# Find the sum of all the numbers that can be written as the sum of fifth powers of their digits.

# Answer: 443839

def fifth_power_digits?(number, limit)
  target = 0
  limit.to_s.size.times { |i| target += number.to_s[i].to_i**5 }
  number.to_s.size > 1 && target == number
end

answer = 0
limit = 9**5

index = 1
while limit.to_s.size > index ## sets conservative limit at the point where adding a digit wouldn't increase the order of magnitude
  limit += 9**5
  index += 1
end

index = 1
while index <= limit
  answer += index if fifth_power_digits?(index, limit)
  index += 1
end

puts answer

# real    0m0.974s
# user    0m0.884s
# sys     0m0.088s
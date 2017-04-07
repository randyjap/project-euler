# The Fibonacci sequence is defined by the recurrence relation:

#     Fn = Fn−1 + Fn−2, where F1 = 1 and F2 = 1.

# Hence the first 12 terms will be:

#     F1 = 1
#     F2 = 1
#     F3 = 2
#     F4 = 3
#     F5 = 5
#     F6 = 8
#     F7 = 13
#     F8 = 21
#     F9 = 34
#     F10 = 55
#     F11 = 89
#     F12 = 144

# The 12th term, F12, is the first term to contain three digits.

# What is the index of the first term in the Fibonacci sequence to contain 1000 digits?

# Answer: 4782

array = [1,1]
sum = 1
index = 1
until (array[index] + array[index - 1]).to_s.size >= 1000
  sum += array[index]
  array << array[index] + array[index - 1]
  index += 1
end

puts index + 2 ## or array.size

# real    0m0.214s
# user    0m0.088s
# sys     0m0.120s

count = 2
a, b, h = 1, 1, 2
until h.to_s.size >= 1000
  count += 1
  h = a + b
  a = b  
  b = h
end
puts count

# real    0m0.199s
# user    0m0.116s
# sys     0m0.080s
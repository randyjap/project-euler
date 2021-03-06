# Consider all integer combinations of ab for 2 ≤ a ≤ 5 and 2 ≤ b ≤ 5:

#     22=4, 23=8, 24=16, 25=32
#     32=9, 33=27, 34=81, 35=243
#     42=16, 43=64, 44=256, 45=1024
#     52=25, 53=125, 54=625, 55=3125

# If they are then placed in numerical order, with any repeats removed, we get the following sequence of 15 distinct terms:

# 4, 8, 9, 16, 25, 27, 32, 64, 81, 125, 243, 256, 625, 1024, 3125

# How many distinct terms are in the sequence generated by ab for 2 ≤ a ≤ 100 and 2 ≤ b ≤ 100?

# Answer: 9183

solution_set = []
(2..100).to_a.each do |i|
  (2..100).to_a.each do |ii|
    solution_set << i**ii
  end
end

puts solution_set.uniq.size

# real    0m0.185s
# user    0m0.092s
# sys     0m0.092s

########################### Refactored ###########################

((2..100).to_a + (2..100).to_a).combination(2).to_a.map { |num| num[0]**num[1] }.uniq.size ## seems to perform worse

# real    0m0.209s
# user    0m0.104s
# sys     0m0.100s
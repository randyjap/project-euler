# Starting in the top left corner of a 2×2 grid, and only being able to move to the right and down, there are exactly 6 routes to the bottom right corner.

# How many such routes are there through a 20×20 grid?

# Answer: 137846528820

grid_size = 20
paths = 1

grid_size.times do |idx|
  paths *= (2 * grid_size) - idx
  paths /= idx + 1
end

puts paths

# real    0m0.613s
# user    0m0.112s
# sys     0m0.116s
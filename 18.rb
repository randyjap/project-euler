# By starting at the top of the triangle below and moving to adjacent numbers on the row below, the maximum total from top to bottom is 23.

# That is, 3 + 7 + 4 + 9 = 23.

# 3
# 7 4
# 2 4 6
# 8 5 9 3

# Find the maximum total from top to bottom of the triangle below:

# NOTE: As there are only 16384 routes, it is possible to solve this problem by trying every route. However, Problem 67, is the same challenge with a triangle containing one-hundred rows; it cannot be solved by brute force, and requires a clever method! ;o)

# Answer: 1074

triangle = \
"75
95 64
17 47 82
18 35 87 10
20 04 82 47 65
19 01 23 75 03 34
88 02 77 73 07 63 67
99 65 04 28 06 16 70 92
41 41 26 56 83 40 80 70 33
41 48 72 33 47 32 37 16 94 29
53 71 44 65 25 43 91 52 97 51 14
70 11 33 28 77 73 17 78 39 68 17 57
91 71 52 38 17 14 91 43 58 50 27 29 48
63 66 04 68 89 53 67 30 73 16 69 87 40 31
04 62 98 27 23 09 70 98 73 93 38 53 60 04 23"

triangle = triangle.split("\n").map { |level| level.split(" ").map { |num| num.to_i } }

def largest_sum_path(triangle, y = 0, x = 0)
  path = [triangle[y][x]]

  return path if y == triangle.length - 1

  left  = largest_sum_path(triangle, y + 1, x)
  right = largest_sum_path(triangle, y + 1, x + 1)

  path.concat([left, right].max_by { |p| p.inject(:+) })
end

puts largest_sum_path(triangle).inject(:+)

# real    0m0.269s
# user    0m0.144s
# sys     0m0.120s

########################### Refactored ###########################

triangle = triangle.split("\n").map { |level| level.split(" ").map { |num| num.to_i } }

## dynamic programming approach, realizing that the you merge paths from the bottom up and that nodes are shared and merge
(triangle.length - 1).downto(0) do |level|
  0.upto(level-1) do |column| # level determines number of columns
    triangle [level-1][column] += [triangle [level][column], triangle [level][column+1]].max #modify the a level -1 deep with the largest connected option below it
  end
end
 
puts triangle[0][0]

# real    0m0.167s
# user    0m0.088s
# sys     0m0.084s
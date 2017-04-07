# A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,

# a2 + b2 = c2
# For example, 32 + 42 = 9 + 16 = 25 = 52.

# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.

# Answer: 31875000

(1..1000).each do |a|
  (a..1000).each do |b|
    c = (1000 - a - b)
    break puts a * b * c if a * a + b * b == c * c && a + b + c == 1000
  end
end

# real    0m0.221s
# user    0m0.128s
# sys     0m0.092s
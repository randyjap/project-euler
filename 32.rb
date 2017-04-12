# Brute Force
possibilities = (1..4999).flat_map do |a|
  (1..99).map do |b|
    [a.to_s + b.to_s + (a * b).to_s, a * b]
  end
end

selected = possibilities.select do |p|
  p[0].length == 9 && p[0].each_char.sort.join == "123456789"
end
selected.map { |p| p[1] }.uniq.reduce(:+)

# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

# Find the sum of all the primes below two million.

# Answer: 142913828922

require 'prime'

sum = 0
Prime.each do |x|
  sum += x if x < 2_000_000
  break if x >= 2_000_000
end

puts sum

# real    0m0.347s
# user    0m0.272s
# sys     0m0.072s

########################### Refactored ###########################

### another prime checker variant, non-built in method
def prime?(number)
  if number == 1
    return false
  elsif number < 4
    return true
  elsif number % 2 == 0
    return false
  elsif number < 9
    return true
  elsif number % 3 == 0
    return false
  else
    r = (Math.sqrt(number)).floor
    f = 5
    while f <= r
      if number % f == 0
        return false
      elsif number % (f + 2) == 0
        return false
      end
      f += 6
    end
    return true
  end
end

puts (1..2_000_000).select { |x| prime?(x) }.inject(:+)

# real    0m3.259s
# user    0m3.164s
# sys     0m0.084s
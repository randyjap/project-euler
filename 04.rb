# A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.

# Find the largest palindrome made from the product of two 3-digit numbers.

# Answe: 906609

def palindrome?(string)
  reversed = ""
  string.each_char do |char|
    reversed = char + reversed
  end
  reversed == string ? true : false
end

largest = 10000
(100..999).to_a.each do |i|
  (100..999).to_a.each do |ii|
    if palindrome?((i * ii).to_s) && (i * ii) > largest
      largest = i * ii
    end
  end
end

puts largest

# real    0m1.660s
# user    0m1.392s
# sys     0m0.140s

########################### Refactored ###########################

def reverse(n)
  reversed = 0
  while n > 0
    reversed = 10 * reversed + n % 10
    n = n / 10
  end
  reversed
end

def palindrome?(n)
  n == reverse(n)
end

largest_palindrome = 0
a = 999
while a >= 100
  b = 999
  while b >= a
    break if a * b <= largest_palindrome
    largest_palindrome = a * b if palindrome?(a * b)
    b -= 1
  end
  a -= 1
end

puts largest_palindrome

# real    0m0.154s
# user    0m0.072s
# sys     0m0.080s
# If the numbers 1 to 5 are written out in words: one, two, three, four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.

# If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?

# NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20 letters. The use of "and" when writing out numbers is in compliance with British usage.

# Answer: 21124

### recycled former solution for 'test-first-ruby'
class Fixnum
  def in_words(number = self, count_zero = true)
    return "zero" if number == 0 && count_zero == true
    number_words =
    {
      1_000_000_000_000   => "trillion",    1_000_000_000 => "billion",     1_000_000       => "million",
      1_000               => "thousand",    100           => "hundred",     90              => "ninety",
      80                  => "eighty",      70            => "seventy",     60              => "sixty",
      50                  => "fifty",       40            => "forty",       30              => "thirty",
      20                  => "twenty",      19            => "nineteen",    18              => "eighteen",
      17                  => "seventeen",   16            => "sixteen",     15              => "fifteen",
      14                  => "fourteen",    13            => "thirteen",    12              => "twelve",
      11                  => "eleven",      10            => "ten",         9               => "nine",
      8                   => "eight",       7             => "seven",       6               => "six",
      5                   => "five",        4             => "four",        3               => "three",
      2                   => "two",         1             => "one"
    }
    number_words.keys.each do |key|
      if number.to_s.length == 1 ## all singles can be retrieved from hash
        return "#{number_words[number]}"
      elsif number.to_s.length == 2 && number / key != 0 ## many irregularities in the tens, the second conditions makes sure you use the highest key less than the given number
        return "#{number_words[key]}" if number == key
        return "#{number_words[key]} " + in_words(number % key) ## the modulo operator is what separates out the singles remainder for a simple lookup--evals from "0" to nil if the tens is in the hash
      elsif number / key != 0 ## regular repeating power of 10^3 pattern
        return in_words(number / key) + " #{number_words[key]}" if number % key == 0 ## nothing to follow, removes trailing space
        return in_words(number / key) + " #{number_words[key]} " + in_words(number % key, false) ## don't repeat zeros
      end
    end
  end
end

sum = 0
(1..1000).each do |i|
  sum += i.in_words.gsub(' ', '').size
  sum += 3 if 1000 > i && i > 100 ## Add the 'and's back in
  sum -= 3 if [200, 300, 400, 500, 600, 700, 800, 900].include?(i) ## Discount any 'and's that are superflous
end

puts sum

# real    0m0.278s
# user    0m0.164s
# sys     0m0.096s
# Using names.txt (right click and 'Save Link/Target As...'), a 46K text file containing over five-thousand first names, begin by sorting it into alphabetical order. Then working out the alphabetical value for each name, multiply this value by its alphabetical position in the list to obtain a name score.

# For example, when the list is sorted into alphabetical order, COLIN, which is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list. So, COLIN would obtain a score of 938 × 53 = 49714.

# What is the total of all the name scores in the file?

# Answer: 871198282

def score(string)  ## assuming all is UPPPERCASE, as it happens to be
  string.chars.map { |letter| letter.ord - 64 }.inject(:+)
  # string.chars.map { |letter| ("A".."Z").to_a.index(letter) + 1 }.inject(:+) # alternative # 
end

handle = File.open("p022_names.txt", "r")

array_of_names = []
handle.each do |text|
  text.gsub('"', '').split(',').each do |name|
    array_of_names << name
  end
end
array_of_names.sort!

puts array_of_names.each_with_index.map { |name,idx| score(name) * (idx+1) }.inject(:+)

# real    0m0.182s
# user    0m0.080s
# sys     0m0.104s
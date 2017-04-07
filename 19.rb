# You are given the following information, but you may prefer to do some research for yourself.

#     1 Jan 1900 was a Monday.
#     Thirty days has September,
#     April, June and November.
#     All the rest have thirty-one,
#     Saving February alone,
#     Which has twenty-eight, rain or shine.
#     And on leap years, twenty-nine.
#     A leap year occurs on any year evenly divisible by 4, but not on a century unless it is divisible by 400.

# How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)?

# Answer: 171

year = 1901
month = 1
day = 0
count = 1
number_of_sundays = 0

until year == 2000 && month == 12 && day == 31
  number_of_sundays += 1 if count % 7 == 0 && day == 1
  count += 1
  day += 1
  
  if month == 1 && day == 32
    month += 1
    day = 1
  elsif month == 2 && day == 29 && (year % 4 != 0 || (year % 100 != 0) || year % 400 == 0)
    month += 1
    day = 1
  elsif month == 2 && day == 30
    month += 1
    day = 1
  elsif month == 3 && day == 32
    month += 1
    day = 1
  elsif month == 4 && day == 31
    month += 1
    day = 1
  elsif month == 5 && day == 32
    month += 1
    day = 1
  elsif month == 6 && day == 31
    month += 1
    day = 1
  elsif month == 7 && day == 32
    month += 1
    day = 1
  elsif month == 8 && day == 32
    month += 1
    day = 1
  elsif month == 9 && day == 31
    month += 1
    day = 1
  elsif month == 10 && day == 32
    month += 1
    day = 1
  elsif month == 11 && day == 31
    month += 1
    day = 1
  elsif month == 12 && day == 32
    month = 1
    day = 1
    year += 1
  end
end

puts number_of_sundays

# real    0m0.208s
# user    0m0.116s
# sys     0m0.088s

########################### Refactored ###########################

### Takes advantage of existing implementation but performs slower
start_date = Time.new(1901,01,01)
end_date = Time.new(2000,12,31)

counter = 0
while end_date > start_date
  counter += 1 if start_date.sunday? && start_date.day == 1
  start_date += 24*60*60
end

puts counter

# real    0m0.639s
# user    0m0.132s
# sys     0m0.504s
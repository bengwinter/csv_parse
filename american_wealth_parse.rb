require 'csv'
require 'json'
require 'date'
require 'pry'


full_hash = {}
check_array = []
CSV.foreach("2013_analysis.csv") do |row|
  income_entries = []
  key = row.shift
  income_averages = []
  breakdown = row.each_slice(2).to_a
  breakdown.each do |x|
    x[0].to_i.times do 
      income_entries << x[1].to_i
    end
  end
  split_value = (income_entries.length/100)
  percentiles = income_entries.each_slice(split_value).to_a
  perenctiles.each do |y|
    income_sum = y.inject(:+)
    num_entries = y.length
    income_average = (income_sum/num_entries)
    @income_averages << income_average
  end
  full_hash[key] = @income_averages
  check_array << full_hash[key].length
end

return check_array

# File.open("2013_analysis.csv", 'r').each_line do |line|
#      binding.pry

#   line.chop.split(',')
# end
require 'csv'
require 'json'
require 'date'
require 'pry'

document_array = ["2013_analysis.csv", "2000_analysis.csv"]
documents_created_array = ["2013_percentile_data.csv", "2000_percentile_data.csv"]

full_array = []
check_array = []
i = 0
j = 0
document_array.each do |doc|
  CSV.foreach(doc) do |row|
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
    income_averages << key
    percentiles.each do |y|
      income_sum = y.inject(:+)
      num_entries = y.length
      income_average = (income_sum/num_entries)
      income_averages << income_average
    end
    full_array << income_averages
    check_array << income_averages.length
    i += 1
    puts i
  end

  CSV.open(documents_created_array[j], "w") do |csv|
    full_array.each do |x|
      csv << x
    end
  end
  j += 1
end

# if loop does not work, just make two of these to execute
# CSV.foreach("2013_analysis.csv") do |row|
#   income_entries = []
#   key = row.shift
#   income_averages = []
#   breakdown = row.each_slice(2).to_a
#   breakdown.each do |x|
#     x[0].to_i.times do 
#       income_entries << x[1].to_i
#     end
#   end
#   split_value = (income_entries.length/100)
#   percentiles = income_entries.each_slice(split_value).to_a
#   income_averages << key
#   percentiles.each do |y|
#     income_sum = y.inject(:+)
#     num_entries = y.length
#     income_average = (income_sum/num_entries)
#     income_averages << income_average
#   end
#   full_array << income_averages
#   check_array << income_averages.length
#   i += 1
#   puts i
# end

# CSV.open("2013_percentile_data.csv", "w") do |csv|
#   full_array.each do |x|
#     csv << x
#   end
# end
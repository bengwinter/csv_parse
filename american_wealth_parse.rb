require 'pry'

file_path =  '~/Projects/csv_parse/2013_analysis.csv'


File.open("2013_analysis.csv", 'r').each_line do |line|
  line.chop.split(',')
    binding.pry
  end
end
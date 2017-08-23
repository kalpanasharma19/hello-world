#!user/bin/ruby


=begin
#Create a csv file
require "csv"
CSV.open("file.csv", "wb") do |csv|
  csv << ["animal", "count", "price"]
  csv << ["fox", "1", "$90.00"]
  csv << %w[goat 5 $150.00]
end
=end

require "csv"

# read a csv file line by line

CSV.foreach("file1.csv") do |row|
	print row,"\n"
end
print"\n"


#change the first column with multiplication of first two columns

CSV.open("file.csv", "wb") do |csv|
	CSV.foreach('file1.csv', converters: :numeric) do |row|
		row[0]=row[0]*row[1]
		csv << row
  	print row,"\n"
	end
end
print"\n"

# copy content from file to file1

CSV.open("file1.csv", "wb") do |csv|
	CSV.foreach("file.csv") do |row|
		csv << row
	end
end

#print content of file1
CSV.foreach("file1.csv") do |row|
	print row, "\n"
end

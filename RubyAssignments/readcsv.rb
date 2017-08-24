#!user/bin/ruby


class Operations_csv_file
  def create_csv()                 #Create a csv file
           
    require "csv"

    CSV.open("file.csv", "wb") do |csv|

      csv << %w[1 2 3 4]
      csv << %w[5 6 7 8]
      csv << %w[3 0 2 9]

    end
  end
  
  def read_csv()                   # read a csv file line by line
    puts "Content of the csv file is : \n\n"
    CSV.foreach("file.csv") do |row|
       
	print row,"\n"

    end
    print "\n"
  end

  def multiplyTwoColumns#change the first column with multiplication of first two columns

    CSV.open("file1.csv", "wb") do |csv|
      CSV.foreach('file.csv', converters: :numeric) do |row|

        row[0]=row[0]*row[1]
	csv << row
  	#print row,"\n"

      end
    end
    CSV.open("file.csv", "wb") do |csv|    # copy content from file1 to file
      CSV.foreach("file1.csv") do |row|

        csv << row

      end
    end
    
    puts "\nContent of the csv file after multiplication of first two columns and replacement of the result with first column is: \n\n"
    CSV.foreach("file.csv") do |row|      #print content of file
	print row, "\n"
    end
  end

end
csv_file = Operations_csv_file.new
csv_file.create_csv()
csv_file.read_csv()
csv_file.multiplyTwoColumns()


=begin

output :

Content of the csv file is : 

["1", "2", "3", "4"]
["5", "6", "7", "8"]
["3", "0", "2", "9"]


Content of the csv file after multiplication of first two columns and replacement of the result with first column is: 

["2", "2", "3", "4"]
["30", "6", "7", "8"]
["0", "0", "2", "9"]

=end


#!user/bin/ruby

class TaxCalculator

  def takeInput()                           # take the input from user for products

    require "csv"                    
    product_details= Array.new()
   
    #column_header = [ "product name", "price", "sale_tax" ]
    
    #CSV.open("saleRecords.csv", "wb", :write_headers=> true, :headers => column_header) do |csv|
     CSV.open("saleRecords.csv", "wb") do |csv|

      while true do 
        puts " Enter the product name (If all products has been recorded, enter 0) : "
        product_details[0] = gets.chomp
        
        if product_details[0] == "0"
          break
        else
          
          puts " Enter the price of product : "
          product_details[1] = gets.chomp
          
          puts " Enter the quantity of product : "
          product_details[2] = gets.chomp

        end
       
        csv << product_details
      end 
    end

  end


  def calculate_tax()                     # calculate the sale tax on products and save at a different file 
    require "csv"
   
    #column_header = [ "product name", "price", "sale_tax" ]
    #CSV.open("saleTaxRecords.csv", "wb", :write_headers=> true, :headers => column_header) do |csv|

    def find_taxfree_products(product_name)
      
      # make a list of taxfree products
      food = [ "chocolate bar", "apple", "orange", "juice", "onion", "tomato", "imported box of chocolates" ]
      medical_products = [ "packet of headache pills", "eye drops", "anticeptics" ]
      books =  [ "book" ]

        if food.include? (product_name) 
          return true
        elsif medical_products.include? (product_name)
          return true
        elsif books.include? (product_name)
          return true
        else
          return false 
        end 
    
    end

    def find_imported_product(product_name)
   
      imported_products = ["imported box of chocolates",  "imported bottle of perfume"]   #list of imported products

        if imported_products.include? (product_name) 
          return true
        else
          return false
        end
     
    end

    def applicable_tax_rate (tax_free, imported)

      tax_rate = 10
      if tax_free
        tax_rate = 0
      end
      if imported
        tax_rate += 5
      end
      return tax_rate

    end

    CSV.open("saleTaxRecords.csv", "wb") do |csv|
      CSV.foreach("saleRecords.csv") do |row|

          if_tax_free = find_taxfree_products(row[0])
          if_imported = find_imported_product(row[0])

          tax_rate = applicable_tax_rate(if_tax_free, if_imported)

          row[3] = (row[1].to_f * tax_rate) / 100 

          csv << row
        
      end
    end

  end
  
  def print_bill()
    require "csv"
    
    def round_nearest(number)
      x1 = (number.round(2) * 100).to_i
      integer_part = (x1 / 100).to_i     # take the integer part of number
      decimal_part =  x1 % 100           # take the decimal part of number
      second_digit_decimal_part= decimal_part % 10 
          
      decimal_part -= second_digit_decimal_part

      if second_digit_decimal_part > 5 
        second_digit_decimal_part = 10
      elsif  second_digit_decimal_part != 0
        second_digit_decimal_part = 5
      end

      number = integer_part + (((decimal_part + second_digit_decimal_part) % 100 ).to_f ) / 100
      return number
    end

    total_sale_tax = 0
    total_price_of_all_products = 0
 
    puts "\n Your Bill\n"
   
    CSV.foreach("saleTaxRecords.csv") do |row| 
                         
# row[0] => product name, row[1] => product price, row[2] => quantity of product, row[3] => sale tax

      total_price_of_product = (row[1].to_f + row[3].to_f) * row[2].to_f
     
      puts " #{row[2]} #{row[0]}: #{round_nearest(total_price_of_product)} \n"

      total_sale_tax += row[2].to_f * row[3].to_f
      total_price_of_all_products += round_nearest(total_price_of_product)
      
    end
    puts " Sales Taxes: #{round_nearest(total_sale_tax)} \n Total: #{total_price_of_all_products} \n"

  end
  
end

output = TaxCalculator.new
output.takeInput()
output.calculate_tax()
output.print_bill()



=begin
Outputs:


Input 1:
1 book at 12.49
1 music CD at 14.99
1 chocolate bar at 0.85

Output 1:
 Your Bill
 1 book: 12.49 
 1 music CD: 16.49 
 1 chocolate bar: 0.85 
 Sales Taxes: 1.5 
 Total: 29.83 


Input 2:
1 imported box of chocolates at 10.00
1 imported bottle of perfume at 47.50

Output 2:
 Your Bill
 1 imported box of chocolates: 10.5 
 1 imported bottle of perfume: 54.65 
 Sales Taxes: 7.65 
 Total: 65.15

Input 3:
1 imported bottle of perfume at 27.99
1 bottle of perfume at 18.99
1 packet of headache pills at 9.75
1 box of imported chocolates at 11.25

Output 3:
 Your Bill
 1 imported bottle of perfume: 32.2 
 1 bottle of perfume: 20.9 
 1 packet of headache pills: 9.75 
 1 imported box of chocolates: 11.85 
 Sales Taxes: 6.7 
 Total: 74.7 


=end


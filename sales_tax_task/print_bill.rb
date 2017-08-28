module SalesTaxCalculator
  class Bill

    def print_bill()
      require "csv"

      total_sale_tax = 0
      total_price_of_all_products = 0

      puts "\n Your Bill\n"

      CSV.foreach("sale_tax_records.csv") do |row|

# row[0] => product name, row[1] => quantity of product, row[2] => product price, row[3] => sale tax

        total_price_of_product = (row[2].to_f + row[3].to_f) * row[1].to_f

        puts " #{row[1]}#{row[0]}: #{round_up(total_price_of_product)} \n"

        total_sale_tax += row[1].to_f * row[3].to_f
        total_price_of_all_products += round_up(total_price_of_product)

      end
      puts " Sales Taxes: #{round_up(total_sale_tax)} \n Total: #{total_price_of_all_products} \n"

    end

    def round_up(number)
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

  end
end

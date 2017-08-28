module SalesTaxCalculator
  class Calculator

    require "csv"

    def calculate_tax()

      CSV.open("sale_tax_records.csv", "wb") do |csv|
        CSV.foreach("sale_records.csv") do |row|

          if_tax_free = find_taxfree_products(row[0])
          if_imported = find_imported_product(row[0])

          tax_rate = applicable_tax_rate(if_tax_free, if_imported)

          row[3] = (row[2].to_f * tax_rate)

          csv << row

        end
      end

    end
    def applicable_tax_rate (tax_free, imported)

      tax_rate = 0.10
      if tax_free
        tax_rate = 0
      end
      if imported
        tax_rate += 0.05
      end
      return tax_rate

    end

    def find_imported_product(product_name)

      product_name.include? 'imported'

    end

    def find_taxfree_products(product_name)

      if product_name.include? ('book')
        return true
      elsif product_name.include? ('pills')
        return true
      elsif product_name.include? ('chocolates')
        return true
      elsif product_name.include? ('chocolate')
        return true
      else
        return false
      end

    end

  end
end

require "csv"

module Product
  def self.seeProduct
    data = CSV.read("product.csv")
    data.each do |row|
      puts "#{row}"
    end
    productOperation(data[0])
  end

  def self.addProduct
    puts "Enter Product Name"
    pname = gets.chomp
    puts "Enter Quantity"
    pqty = gets.chomp.to_i
    puts "Enter Price/Piece"
    price = gets.chomp.to_i
    data = CSV.read('loginData.csv')
    login = data.last[0]
    t = Time.now.usec
    pid = "product" + t.to_s
    product_data = [pid, pname, pqty, price, login]
    CSV.open('product.csv', 'a') do |csv|
      csv << product_data
    end
    Product.productOperation(data[0])
  end

  def self.productOperation(*row)
    login = row.first[0]
    CSV.open("loginData.csv", "a") do |csv|
      csv << [login]
    end
    puts "1 See Stock"
    puts "2 Add Product"
    puts "3 Update Product"
    puts "4 Delete Product"
    puts "5 Logout"
    choice = gets.chomp.to_i
    if choice == 1
      Product.seeProduct
    elsif choice == 2
      Product.addProduct
    elsif choice == 3
      # next
    elsif choice == 4
      # next
    elsif choice == 5
      File.open("loginData.csv", "w") do |file|
      end
    else
      # next
    end
  end
end

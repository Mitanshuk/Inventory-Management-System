require "csv"

module User
  def self.seeUserData
    data = CSV.read("userdata.csv")
    data.each do |row|
      puts "#{row}"
    end
  end

  def self.deleteUserData
    data = CSV.read("userdata.csv")
    data.each_with_index do |row, index|
      puts "#{index} #{row[0]} #{row[1]} #{row.last}"
    end
    puts "Enter the index of the row to be deleted"
    choice = gets.chomp.to_i
    data.delete_at(choice)
    CSV.open("userdata.csv", "w") do |csv|
      data.each do |row|
        csv << row
        Choice.if1
      end
    end
  end

  def self.updateUserData()
    data = CSV.read("userdata.csv")
    data.each_with_index do |row, index|
      puts "#{index} #{row[0]} #{row[1]} #{row.last}"
    end
    puts "Enter the index of the row to be updated:"
    choice = gets.chomp.to_i
    puts "Enter updated name:"
    nm = gets.chomp
    puts "Enter updated password:"
    ps = gets.chomp
    puts "Enter updated location:"
    lc = gets.chomp
    puts "Enter updated email:"
    em = gets.chomp
    id = data[choice][0]
    user_data = [id, nm, ps, lc, em]
    data[choice] = user_data
    CSV.open("userdata.csv", "w") do |csv|
      data.each do |row|
        csv << row
      end
    end
    Choice.if1
  end
end

module Seller
  def self.seeSellerData
    data = CSV.read("sellerdata.csv")
    data.each do |row|
      puts "#{row}"
    end
  end

  def self.deleteSellerData
    data = CSV.read("sellerdata.csv")
    data.each_with_index do |row, index|
      puts "#{index} #{row[0]} #{row[1]} #{row.last}"
    end
    puts "Enter the index of the row to be deleted"
    choice = gets.chomp.to_i
    data.delete_at(choice)
    CSV.open("sellerdata.csv", "w") do |csv|
      data.each do |row|
        csv << row
        Choice.if1
      end
    end
  end

  def self.updateSellerData
    data = CSV.read("sellerdata.csv")
    data.each_with_index do |row, index|
      puts "#{index} #{row[0]} #{row[1]} #{row.last}"
    end
    puts "Enter the index of the row to be updated:"
    choice = gets.chomp.to_i
    puts "Enter updated name:"
    nm = gets.chomp
    puts "Enter updated password:"
    ps = gets.chomp
    puts "Enter updated location:"
    lc = gets.chomp
    puts "Enter updated email:"
    em = gets.chomp
    id = data[choice][0]
    seller_data = [id, nm, ps, lc, em]
    data[choice] = seller_data
    CSV.open("sellerdata.csv", "w") do |csv|
      data.each do |row|
        csv << row
      end
    end
    Choice.if2
  end
end


module Choice
  def self.if1
    puts "1 See user data"
    puts "2 Delete user data"
    puts "3 Update user data"
    choice = gets.chomp.to_i
    if choice == 1
      User.seeUserData
    elsif choice == 2
      User.deleteUserData
    elsif choice == 3
      User.updateUserData()
    else
      puts "Invalid choice"
    end
  end

  def self.if2
    puts "1 See seller data"
    puts "2 Delete seller data"
    puts "3 Update seller data"
    choice = gets.chomp.to_i
    if choice == 1
      Seller.seeSellerData
    elsif choice == 2
      Seller.deleteSellerData
    elsif choice == 3
      Seller.updateSellerData()
    else
      puts "Invalid choice"
    end
  end
end


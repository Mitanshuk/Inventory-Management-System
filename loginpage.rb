$LOAD_PATH << '.'
require 'csv'
require 'admin'
require 'seller'

admin_password = "1234"

def main
  puts "1 login as Admin"
  puts "2 login as Customer"
  puts "3 login as Seller"
  $choice = gets.chomp.to_i
end

main

case $choice
when 1
  puts "Enter Admin's Password"
  password = gets.chomp
  if password == admin_password
    puts "Login successful"
     puts "1 user side"
     puts "2 seller side"
     choice = gets.chomp.to_i
     puts choice
     if choice == 1
      Choice.if1
     elsif choice == 2
      Choice.if2
     end
  else
    puts "Invalid Password"
  end


when 2
  def user_login_account
    puts "Enter ID"
    id = gets.chomp
    puts "Enter Password"
    psd = gets.chomp
    data = CSV.read("userdata.csv")
    match_found = false
    data.each do |row|
      if row[1] == id && row[2] == psd
        puts "Login Successful"
        match_found = true
        break
      end
    end
    unless match_found
      puts "Invalid ID/Password"
      user_login_account
    end
  end

  puts "1 Create New Account"
  puts "2 Already have an Account"
  puts "0 Main Menu"
  choice = gets.chomp.to_i
  if choice == 1
    def user_create_account
      loop do
        puts "Enter Your Details"
        puts "Enter Your Email"
        uemail = gets.chomp
        data = CSV.read("userdata.csv")
        if data.any? { |row| row[4] == uemail }
          puts "Email already exists"
          user_create_account
        else
          puts "Enter Your Name"
          uname = gets.chomp
          puts "Enter Password"
          upwd = gets.chomp
          puts "Enter Your Address"
          uadr = gets.chomp
          t = Time.now.usec

          id = "user" + t.to_s
          user_data = [id, uname, upwd, uadr, uemail]

          CSV.open('userdata.csv', 'a') do |csv|
            csv << user_data
          user_login_account
          end
        end

      end
    end
    user_create_account
  elsif choice == 2
    user_login_account
  elsif choice == 0
    main
end


when 3
  def seller_login_account
    puts "Enter ID"
    id = gets.chomp
    puts "Enter Password"
    psd = gets.chomp
    data = CSV.read("sellerdata.csv")
    match_found = false
    data.each do |row|
      if row[1] == id && row[2] == psd
        puts "Login Successful"
        Product.productOperation(row)
        match_found = true
        break
      end
    end
    unless match_found
      puts "Invalid ID/Password"
      seller_login_account
    end
  end

  puts "1 Create New Account"
  puts "2 Already have an Account"
  puts "0 Main Menu"
  choice = gets.chomp.to_i
  if choice == 1
    def seller_create_account
      loop do
        puts "Enter Your Details"
        puts "Enter Your Email"
        semail = gets.chomp
        data = CSV.read("sellerdata.csv")
        if data.any? { |row| row[4] == semail }
          puts "Email already exists"
          seller_create_account
        else
          puts "Enter Your Name"
          sname = gets.chomp
          puts "Enter Password"
          spwd = gets.chomp
          puts "Enter Your Address"
          sadr = gets.chomp
          t = Time.now.usec

          id = "user_" + t.to_s
          seller_data = [id, sname, spwd, sadr, semail]

          CSV.open('sellerdata.csv', 'a') do |csv|
            csv << seller_data
          end
          seller_login_account
          break
        end
      end
    end
    seller_create_account
  elsif choice == 2
    seller_login_account
  elsif choice == 0
    main

end

else
  puts "Invalid Choice"
end


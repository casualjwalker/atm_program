class Account

	attr_reader :name, :acct_num, :balance
	@@count = 0
	
	def initialize(name, balace)
		@name = name
		@acct_num = @@count
		@balance = balance
		@@count += 1
	end 

	def deposit(amount)
		@balance += amount
	end

	def withdrawal(amount)
		@balance -= amount
	end

	def self.acct_num
		@@count
	end
end

@accounts = []

def main
	puts "Welcome to KB Bank. Where your money is totally safe."
	main_menu
end	

def main_menu
	puts "Please choose from the following options:"
	puts "-------------------"
	puts "1. Open an Account"
	puts "2. View Excisting Account"
	puts "3. End Session"

	choice = gets.chomp.to_i

	case choice 
		when 1
			system "clear"
			create_account
		when 2
			system "clear"
			account_login
		when 3
			end_session
		else
			system "clear"
			puts "Not a valid selection. Try again."
			main_menu
	end		
end

def create_account
	puts "open an Account"
	puts "---------------"
	puts "What's your full name: "
	name = gets.chomp.downcase.split.map(&:capitalize).join(' ')
	puts "How much will your initial deposit be: $"
	balance = gets.chomp.to_f
	new_account = Account.new(name, balance)
	@accounts.push(new_account)
	puts "Account created succesfully."
	puts "Your account number is: #{new_account.acct_num}"
	main_menu_return
end	

def main_menu_return
	puts "Do you want to return to the Main Menu? [Y or N]"
	choice = gets.chomp.upcase

	case choice
		when "Y"
			system "clear"
			main_menu

		when "N"
			end_session
		else
			systme "clear"
			puts "Not a valid selction. Y or N."
			main_menu_return
	end
end

def account_login
	system "clear"
	puts "Account Login"
	puts "-------------"
	puts "Please provide the name on the account:"
	name = gets.chomp.downcase.split.map(&:capitalize).join(' ')
	puts "What is your account number?"
	num = gets.chomp.to_i
	
	acct_found = false
	@accounts.each do |acct|
		if acct.name == name && acct.acct_num == num
			puts "Login Successful!"
			existing_account_menu(acct)
			acct_found = true

	end
end

	if acct_found == false
				system "clear"
				puts "No account found with those credentials. Try again."
				account_login
	end
end

def existing_account_menu(acct)
	puts "Your Account Menu"
	puts "-----------------"
	puts "1. Check Balance"
	puts "2. Make a Deposit"
	puts "3. Make a Withdrawal"
	puts "4. Return to Main Menu"

	choice = gets.chomp.to_i

	case choice
		when 1
			system "clear"
			check_balance(acct)
		when 2
			system "clear"
			make_deposit(acct)
		when 3
			system "clear"
			make_withdrawal(acct)
		when 4
			system "clear"
			main_menu
		else
			system "clear"
			puts "Not a valid selection. Try again."
			existing_account_menu(acct)
	end

end

def check_balance(acct)
	puts "Your current balance is $#{acct.balance}"
	existing_account_return(acct)
end

def make_deposit(acct)
	print "How much are you depositing today? $"
	amount = gets.chomp.to_f
	acct.deposit(amount)
	puts "New account balance is: $#{acct.balance}"
	existing_account_return(acct)
end

def make_withdrawal(acct)
	print "How much are you withdrawing today? $"
	amount = gets.chomp.to_f
	if amount  <= acct.balance
		acct.withdrawal(amount)
		puts "New account balance is: $#{acct.balance}"
		existing_account_return(acct)
	else
		system "clear"
		puts "Insufficient Funds."
		existing_account_return(acct)
	end
end

def existing_account_return(acct)
	puts "Return to..."
	puts "------------"
	puts "1. Account Menu"
	puts "2. Main Menu"
	puts "3. End Session"

	choice = gets.chomp.to_i

	case choice
		when 1
			system "clear"
			existing_account_menu(acct)
		when 2
			system "clear"
			main_menu
		when 3
			system "clear"
			end_session
		else
			system "clear"
			puts "Not a valid selection. Try again."
			existing_account_return(acct)
	end
end  

def end_session
	system "clear"
	puts "Thanks for banking with us. We appreciate your business. \nGoodbye."
end



main
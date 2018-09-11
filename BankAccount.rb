class BankAccount
@@interest_rate = 0.01
@@accounts = []

  def initialize
    @balance = 0;
  end

  def balance
    return @balance
  end

  def balance=(balance)
    @balance = balance
  end

  def deposit(value)
    @balance=(@balance+value)
  end

  def withdraw(value)
    @balance=(@balance-value)
  end

  def self.create
    new_account = BankAccount.new
    @@accounts << new_account
    return new_account
  end

  def self.total_funds
    total_funds = 0
    @@accounts.each do |account|
      total_funds += account.balance
    end
    return total_funds
  end

  def self.interest_time
    @@accounts.each do |account|
      account.balance=(account.balance * (1+@@interest_rate))
    end
  end
end

##Test code
my_account = BankAccount.create
your_account = BankAccount.create
puts my_account.balance # 0
puts BankAccount.total_funds # 0
my_account.deposit(200)
your_account.deposit(1000)
puts my_account.balance # 200
puts your_account.balance # 1000
puts BankAccount.total_funds # 1200
BankAccount.interest_time
puts my_account.balance # 202.0
puts your_account.balance # 1010.0
puts BankAccount.total_funds # 1212.0
my_account.withdraw(50)
puts my_account.balance # 152.0
puts BankAccount.total_funds # 1162.0

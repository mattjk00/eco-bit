class Company < ActiveRecord::Base
  validates :name, presence:true, uniqueness:true, length: {maximum:25, minimum:5}
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :password, :confirmation => true
  serialize :bought_stocks, Array
  
  has_secure_password
  
  def updateStats # updates the stats, mostly used to update stock price
    self.stock_price += 1; # increase the stock price by 1
    
    if self.save
      puts "#{self.name} stock price is now: #{self.stock_price}"
    else
      self.errors.full_messages.each do |msg|
        puts "ERROR: #{msg}"
      end
    end
  end
  
  def stocks_bought_in(company_name) # get how many stocks are bought in a company
    count = 0
    
    if self.bought_stocks == nil
      self.bought_stocks = Array.new
    end
    
    puts "Seaching for #{company_name}"
    self.bought_stocks.each do |stock|
      if stock == company_name
        count = count + 1
      end
      puts "Stock: #{stock}"
    end
    
    return count
  end
end

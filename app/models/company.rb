class Company < ActiveRecord::Base
  validates :name, presence:true, uniqueness:true, length: {maximum:25, minimum:5}
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :password, :confirmation => true
  
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
end

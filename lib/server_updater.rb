
class ServerUpdater
  
  def initialize # init the class
    puts "\n\n---------- Eco-Bit Server Updater Started... ----------\n\n\n" # print a starting message
  end
  
  public
  def updateCompanies # update each company in the database
    puts "Starting update..."

    Thread.new do
      
      while true
      
        Company.all.each do |company| # loop through companies
          company.updateStats # update the stats of a company
          puts "Updated: #{company.name}, confirming stock price: #{company.stock_price}" # display changes
        end
      
       sleep(10.seconds)
      end
      
    end
  end
  
  def verifyChange # used to verify that changes have occured to the database
    
    Company.all.each do |company| # loop through company
      puts "Verifying COMPANY:#{company.name}, STOCK_PRICE:#{company.stock_price}"
    end
  end
  
end
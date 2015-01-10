
class ServerUpdater
  
  def initialize # init the class
    puts "\n\n---------- Eco-Bit Server Updater Started... ----------\n\n\n" # print a starting message
  end
  
  def updateCompanies # update each company in the database

    Company.all do |company| # loop through companies
      company.updateStats # update the stats of a company
    end
    
  end
  
end
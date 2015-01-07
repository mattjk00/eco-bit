class ServerUpdater
  
  def updateCompanies

    Company.all do |company|
      company.updateStats
    end
    
  end
  
end
class TaskCaller
  
  def update_servers() # function to update each company in the server

      Company.all.each do |company|
        
        puts "Updating: #{company.name}..."
        
        company.updateStats
      end
    
  end
  
end
class Company < ActiveRecord::Base
  validates :name, presence:true, uniqueness:true, length: {maximum:25, minimum:5}
  
  def updateStats
    self.update(name: "[deleted]")
  end
end

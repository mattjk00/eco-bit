class Company < ActiveRecord::Base
  validates :name, presence:true, uniqueness:true, length: {maximum:25, minimum:5}
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :password, :confirmation => true, length: { minimum:7, maximum:36 }
  
  has_secure_password
  
  def updateStats
    self.update(name: "[deleted]")
  end
end

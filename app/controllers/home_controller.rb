class HomeController < ApplicationController
  def index
    @name = ""
    @company = Company.new
  end
  
  def search
     
  end
  
  private
  def company_params
      params.require(:company).permit(:name, :email, :password, :password_confirmation)
  end
end

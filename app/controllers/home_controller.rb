class HomeController < ApplicationController
  def index
    @name = ""
    @search_company = Company.new
    @company = Company.new
  end
  
  def search
     @search_company = Company.new(params[:name])
     flash[:search_token] = "Searching for: #{@search_company.name}"
  end
end

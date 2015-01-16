class CompaniesController < ApplicationController
  def new
    @company = Company.new
  end
  
  def create
    @company = Company.new(company_params)
    
    if @company.save
      redirect_to company_path(@company)
    else
      render 'new'
    end
  end
  
  def show
    @company = Company.find(params[:id])
    @user_company = Company.find_by_name(session[:user_id])
  end
  
  def destroy
    @company = Company.find(params[:id])
    @company.destroy
    
    redirect_to root_path
  end
  
  def buy
    @company = Company.find(params[:id])
    @user_company = Company.find_by_name(session[:user_id])
    stocksArray = Array.new
    
    puts "\n\n\nSTOCKS: #{@user_company.bought_stocks}\n\n\n"
    if @user_company.bought_stocks == nil
      @user_company.bought_stocks = Array.new
      
    end
    stocksArray << @company.name # buy the stock
    puts "\n\n\nSTOCKS: #{@user_company.bought_stocks}\n\n\n"
    
    @user_company.bought_stocks = @user_company.bought_stocks + stocksArray
    
    if @user_company.save
      puts "Successfully bought stock in #{@company.name}"
    else
      puts "\n\n\n"
      @user_company.errors.full_messages.each do |msg|
        puts "#{msg}\n"
      end
    end
    
    redirect_to company_path(@company)
  end
  
  private
  def company_params
      params.require(:company).permit(:name, :email, :password, :password_confirmation)
    end
end

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
  end
  
  def destroy
    @company = Company.find(params[:id])
    @company.destroy
    
    redirect_to root_path
  end
  
  def buy
    @company = Company.find(params[:id])
    @user_company = Company.find_by_name(session[:user_id])
    
    puts @user_company.bought_stocks
    if @user_company.bought_stocks == nil
      @user_company.bought_stocks = Array.new
    end
    @user_company.bought_stocks << @company.name # buy the stock
    @user_company.save
    
    flash[:buy_status] = "You have bought #{@user_company.stocks_bought_in(@company.name)} stock in #{@company.name}"
    redirect_to company_path(@company)
  end
  
  private
  def company_params
      params.require(:company).permit(:name, :email, :password, :password_confirmation)
    end
end

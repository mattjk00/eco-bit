class CompaniesController < ApplicationController
  def new
    @company = Company.new
    @task = TaskCaller.new
    @task.update_servers
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
  
  private
  def company_params
      params.require(:company).permit(:name, :email, :password, :password_confirmation)
    end
end

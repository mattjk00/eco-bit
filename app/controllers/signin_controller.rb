class SigninController < ApplicationController
  def index
    @company = Company.new
    render 'new'
  end
  
  def new
    @company = Company.new # blank user
  end

  def create
    @company = Company.new(company_params)
    @foundcomp = Company.find_by_email(@company.email)

    if @foundcomp != nil # if found a company
      if @foundcomp.authenticate(@company.password) #check password
        session[:user_id] = @foundcomp.name
        
        if @foundcomp.name == "admin" #if the admin is logged in
          session[:admin_auth] = true
        end
        
        redirect_to root_path #send to home
      else
        render 'new' #redirect
        flash[:signin_error] = "Invalid password"
      end
    else
      render 'new'
      flash[:signin_error] = "Invalid email"
    end
  end
  
  
  private
  def company_params
      params.require(:company).permit(:name, :email, :password, :password_confirmation)
  end
end
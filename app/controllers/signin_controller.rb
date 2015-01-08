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
    
    puts "\n\n\n\n\n\n\n"
    puts @foundcomp.password_digest
    puts "\n\n\n\n\n\n\n"
    
    if @foundcomp != nil # if found a company
      if @foundcomp.authenticate(@company.password) #check password
        session[:user_id] = @foundcomp.name
        redirect_to root_path #send to home
      else
        render 'new' #redirect
        flash[:signin_error] = "Invalid password"
      end
    else
      render 'new'
      flash[:signin_error] = "Invalid email"
    end
    
    puts "TRIED: #{@company.email}"
  end
  
  
  private
  def company_params
      params.require(:company).permit(:name, :email, :password, :password_confirmation)
  end
end
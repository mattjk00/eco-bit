class AdminController < ApplicationController
  before_filter :authorize_admin, only: :index
  http_basic_authenticate_with name: "admin_eco_bit_core_bit", password: "!#%&()*^$@___foo___bar"
  
  def index
    @server_updater = ServerUpdater.new
    @server_updater.updateCompanies
    @companies = Company.all
  end
end

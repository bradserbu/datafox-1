class MainController < ApplicationController
  http_basic_authenticate_with name: "tanlin", password: "tanlin"

  def index

  end
  
  def similarCompanies 
    companiesCommander = CompaniesCommander.new
    @rankedCompanies = companiesCommander.getComapnyScoresByTheCompany(params[:name])
  end

end

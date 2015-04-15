class MainController < ApplicationController
  def index
    @companies = Company.all
  end

  def filter
  end
  
  def new
    @company = Company.new(company_params)
    @company.save
  end

  private
  	def company_params
  	  params.require(:company).permit(:name, :category, :year, :stage, :flied, :detail)
  	end
end

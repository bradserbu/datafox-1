class CompaniesController < ApplicationController
  def index
    @companies = Company.all
  end

  def similar
    companiesCommander = CompaniesCommander.new
    @companies = companiesCommander.getComapnyScoresByTheCompany(params[:id])
  end
  
  def new
    
  end

  def edit
    @company = Company.find(params[:id])
  end

  def create
    investorArr = Array.new
    @investors = company_params[:investors].split(/[\s,]+/)
    @investors.each do |investor| 
      find_investor = Investor.find_by_name(investor)
      if find_investor.nil?
        investor = Investor.new
        investor.name = investor
        investor.save
        investorArr << investor
      else
        investorArr << find_investor
      end
    end

    @company = build_company(investorArr)
    if @company.save
    	redirect_to @company
    else
    	render 'new'
    end
  end

  def update 
  	@company = Company.find(params[:id])

  	if @company.update(company_params)
  		redirect_to @company
  	else
  		render 'edit'
  	end
  end

  def show
    @company = Company.find(params[:id])
  end

  def destroy
  	@company = Company.find(params[:id])
  	@company.destroy

  	redirect_to companies_path
  end

  private
    def build_company(investorArr)
      company = Company.new
      company.name = company_params[:name]
      company.category = company_params[:category]
      company.year = company_params[:year]
      company.stage = company_params[:stage]
      company.field = company_params[:fields]
      company.detail = company_params[:detail]
      company.investors = investorArr
      return company
    end

  private
  	def company_params
  	  params.require(:company).permit(:name, :category, :year, :stage, :fields, :detail, :investors)
  	end
end

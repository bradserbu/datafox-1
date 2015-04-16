class InvestorsController < ApplicationController
  def index
    @investors = Investor.all
  end

  def filter
  	
  end
  
  def new
    
  end

  def edit
  	@investor = Investor.find(params[:id])
  end

  def create

  	@company_array = Array.new
    @companies = investor_params[:companies].split(/[\s,]+/)
    @companies.each do |company| 
      @find_company = Investor.find_by_name(company)
      if @find_company.nil?
        @company = Company.new
        @company.name = company
        @company.save
        @company_array << @company
      else
        @company_array << @find_company
      end
    end

  	@investor = build_investor(@company_array)
    if @investor.save
    	redirect_to @investor
    else
    	render 'new'
    end
  end

  def update 
  	@investor = Investor.find(params[:id])

  	if @investor.update(investor_params)
  		redirect_to @investor
  	else
  		render 'edit'
  	end
  end

  def show
    @investor = Investor.find(params[:id])
  end

  def destroy
  	@investor = Investor.find(params[:id])
  	@investor.destroy

  	redirect_to investors_path
  end

  private
    def build_investor(company_array)
      @investor = Investor.new
      @investor.name = investor_params[:name]
      @investor.category = investor_params[:category]
      @investor.location = investor_params[:location]
      @investor.field = investor_params[:field]
      @investor.detail = investor_params[:detail]
      @investor.companies = company_array
      return @company
    end

  private
  	def investor_params
  	  params.require(:investor).permit(:name, :category, :location, :field, :detail, :companies)
  	end
end

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
  	@investor = Investor.new(investor_params)
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
  	def investor_params
  	  params.require(:investor).permit(:name, :category, :location, :field, :detail)
  	end
end

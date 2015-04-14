class MainController < ApplicationController
  def index
    @companies = Company.all
  end
  def filter
  end
  
  def new
    @company = Company.new
  end
end

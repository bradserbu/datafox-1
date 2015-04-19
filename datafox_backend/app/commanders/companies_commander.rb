class CompaniesCommander
	def getComapnyScoresByTheCompany(:id)
    @comapnies = Company.all
    @theCompany = Company.find(params[:id])
    @rankedCompanies = Array.new
    @comapnies.each do | company | 
      
    end
  end
end
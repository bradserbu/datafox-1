class CompaniesCommander
	def getComapnyScoresByTheCompany(:id)
    @comapnies = Company.all
    @companyA = Company.find(params[:id])

    AfieldSet = Set.new
    @companyA.fields.each do | field | 
      AfieldSet << field.name
    end
    @rankedCompanies = Array.new
    #calculate other company scores to company A
    @comapnies.each do | company | 
      fieldSet = Set.new
      company.fields.each do | field |
        fieldSet << field.name
      end

      score = 0

      if (fieldSet & AfieldSet != nil)
        if (fieldSet - AfieldSet == nil)
          score += 0.5 
        end else
          score += 0.3
        end
      end

      if (company.category == @companyA.category)
        score += 0.1

      score += 0.025 * (4 - (@companyA.stage - company.stage).abs)

      if (@companyA.investor.level == company.investor.level)
        score += 0.2
      if (@companyA.founder.level == company.founder.level)
        score += 0.1

      rankedCompany = Struct.new(company, score)
      @rankedCompanies << rankedCompany
    end

    @rankedCompanies.sort_by { |rankedCompany| rankedCompany.score }
  end
end
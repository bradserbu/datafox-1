class CompaniesCommander
	def getComapnyScoresByTheCompany(name)
    @comapnies = Company.all
    @theCompany = Company.find_by_name(name)

    theFieldSet = Set.new
    @theCompany.fields.each do | field | 
      theFieldSet << field.name
    end
    @rankedCompanies = Array.new
    #calculate other company scores to company A
    @comapnies.each do | company | 
      fieldSet = Set.new
      company.fields.each do | field |
        fieldSet << field.name
      end

      score = 0

      
      if (fieldSet - theFieldSet == nil)
        score += 0.5 
      else
        score += 0.3
      end if (fieldSet & theFieldSet != nil)
      
      score += 0.1 if (company.category == @theCompany.category)

      score += 0.025 * (4 - (@theCompany.stage - company.stage).abs)

      score += 0.2 if (@theCompany.investor.level == company.investor.level)

      score += 0.1 if (@theCompany.founder.level == company.founder.level)

      rankedCompany = Struct.new(company, score)
      @rankedCompanies << rankedCompany
    end

    @rankedCompanies.sort_by { |rankedCompany| rankedCompany.score }

    return @rankedCompanies
  end
end
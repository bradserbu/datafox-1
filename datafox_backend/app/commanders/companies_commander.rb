class CompaniesCommander

  class RankedCompany
    attr_accessor :company, :score
    def initialize(company, score)
      @company = company
      @score = score
    end
  end

	def getComapnyScoresByTheCompany(name)
    @rankedCompanies = Array.new
    @comapnies = Company.all
    Rails.logger.debug("some name: #{name.inspect}")
    @theCompany = Company.where(name: name).take

    Rails.logger.debug("some company: #{@theCompany.inspect}")
    return @rankedCompanies if @theCompany == nil
    theFieldSet = Set.new
    @theCompany.company_fields.each do | field | 
      theFieldSet << field.name
    end


    #calculate other company scores to company A
    @comapnies.each do | company | 
      fieldSet = Set.new
      company.company_fields.each do | field |
        fieldSet << field.name
      end

      score = 0

      
      if (fieldSet - theFieldSet == nil)
        score += 0.5 
      else
        score += 0.3
      end if (fieldSet & theFieldSet != nil)
      
      score += 0.1 if (company.category == @theCompany.category)

      score += 0.025 * (4 - (@theCompany.stage.to_i - company.stage.to_i).abs)

      #score += 0.2 if (@theCompany.investors.level == company.investors.level)

      #score += 0.1 if (@theCompany.founders.level == company.founders.level)
      
      @rankedCompanies << RankedCompany.new(company, score)
    end

    @rankedCompanies.sort_by { |rankedCompany| rankedCompany.score }

    return @rankedCompanies
  end
end
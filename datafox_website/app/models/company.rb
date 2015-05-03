class Company < ActiveRecord::Base
  has_many :investors
  has_many :company_fields
  validates :name, presence: true

  def self.filter(params)
    Rails.logger.debug("some stage param: #{params[:stage].inspect}")
    return Company.where(stage: params[:stage])
  end
end

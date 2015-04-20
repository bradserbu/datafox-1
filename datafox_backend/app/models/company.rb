class Company < ActiveRecord::Base
  has_many :investors
  has_many :company_fields
  validates :name, presence: true

end

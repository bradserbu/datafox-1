class Investor < ActiveRecord::Base
  has_many :companies
  validates :name, presence: true
end

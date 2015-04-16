class Investor < ActiveRecord::Base
  has_many :companies, dependent: :destroy
  validates :name, presence: true

end

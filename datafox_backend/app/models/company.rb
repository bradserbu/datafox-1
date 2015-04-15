class Company < ActiveRecord::Base
	has_many :investors
    validates :name, presence: true
end

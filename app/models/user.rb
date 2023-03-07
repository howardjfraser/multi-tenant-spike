class User < ApplicationRecord
  has_many :company_users
  has_many :companies, through: :company_users
end

class Company < ApplicationRecord
  has_many :company_users
  has_many :users, through: :company_users
end

# == Schema Information
#
# Table name: companies
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

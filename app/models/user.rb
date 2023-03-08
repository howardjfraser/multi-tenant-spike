class User < ApplicationRecord
  include CompanyOwnable # TODO: do we want to do this?

  has_many :company_users
  has_many :companies, through: :company_users, dependent: :destroy
end

# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

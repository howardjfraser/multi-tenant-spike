class Project < ApplicationRecord
  include CompanyOwnable

  belongs_to :company

  has_many :project_stakeholders
  has_many :stakeholders, through: :project_stakeholders, dependent: :destroy
end

# == Schema Information
#
# Table name: projects
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  company_id :bigint           not null
#
# Indexes
#
#  index_projects_on_company_id  (company_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#

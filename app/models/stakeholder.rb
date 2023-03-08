class Stakeholder < ApplicationRecord
  has_many :project_stakeholders
  has_many :projects, through: :project_stakeholders, dependent: :destroy
end

# == Schema Information
#
# Table name: stakeholders
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

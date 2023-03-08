module WithCurrentCompany
  def setup
    Current.user = FactoryBot.create(:company_user).user
    Current.company = Current.user.companies.first
  end
end

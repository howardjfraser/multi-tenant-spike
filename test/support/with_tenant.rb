module WithTenant
  def setup
    Current.user = create(:company_user).user
    Current.company = Current.user.companies.first
  end
end

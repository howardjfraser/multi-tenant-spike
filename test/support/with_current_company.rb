module WithCurrentCompany
  def setup
    Current.user = users(:one)
    Current.company = Current.user.companies.first
  end
end

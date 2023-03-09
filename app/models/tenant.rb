# NOTE: equivalent to Apartment helper class
# TODO: should maybe live somewhere else...
class Tenant
  def self.switch!(company)
    Current.company = company
  end

  def self.switch(company)
    current_company = Current.company
    Current.company = company

    yield if block_given?

    Current.company = current_company
  end

  def self.current
    Current.company
  end
end

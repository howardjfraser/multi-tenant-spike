# NOTE: unscope tenanted classes to destroy_all
Project.unscoped.destroy_all

# NOTE: untenanted classes work normally
User.destroy_all
Stakeholder.destroy_all

# NOTE: where untenanted classes have direct association with tenanted classes, need to
# set Current.company to destroy? Even if no tenanted instances exist and there is no
# dependent: :destroy.
Company.all.each do |c|
  Current.company = c
  c.destroy!
end

abc = Company.create! name: "ABC Co"
xyz = Company.create! name: "XYZ Co"

abc.users.create! name: Faker::Name.first_name
abc.users.create! name: Faker::Name.first_name

xyz.users.create! name: Faker::Name.first_name
xyz.users.create! name: Faker::Name.first_name

multi = User.create! name: Faker::Name.first_name

abc.users << multi
xyz.users << multi

8.times do
  Stakeholder.create! name: Faker::Name.first_name
end

Current.company = abc
abc.projects.create! name: Faker::Company.bs
abc.projects.create! name: Faker::Company.bs

Current.company = xyz
xyz.projects.create! name: Faker::Company.bs

Project.all.each { |p| p.stakeholders << Stakeholder.all.sample(4) }

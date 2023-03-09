# NOTE: unscope tenanted classes to destroy_all
Project.unscoped.destroy_all

# NOTE: untenanted classes work normally
User.destroy_all
Stakeholder.destroy_all

# NOTE: where an untenanted class has_many with a tenanted class, to destroy the
# untenanted class you need to set Current.company. Even if no tenanted instances
# exist and there is no dependent: :destroy.
Tenant.all { |c| c.destroy! }

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

Tenant.switch(abc) do
  abc.projects.create! name: Faker::Company.bs
  abc.projects.create! name: Faker::Company.bs
end

Tenant.switch(xyz) do
  xyz.projects.create! name: Faker::Company.bs
end

# NOTE: legit use of unscoped for admin purposes...
Project.unscoped.count { |p| p.stakeholders << Stakeholder.all.sample(4) }

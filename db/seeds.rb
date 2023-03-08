# for now uncomment `include Tenanted`` in Project to make this work

Company.destroy_all
User.destroy_all
Project.destroy_all
Stakeholder.destroy_all

abc = Company.create! name: "ABC Co"
xyz = Company.create! name: "XYZ Co"

abc.users.create! name: Faker::Name.first_name
abc.users.create! name: Faker::Name.first_name

xyz.users.create! name: Faker::Name.first_name
xyz.users.create! name: Faker::Name.first_name

multi = User.create! name: Faker::Name.first_name

abc.users << multi
xyz.users << multi

abc.projects.create! name: Faker::Company.bs
abc.projects.create! name: Faker::Company.bs

xyz.projects.create! name: Faker::Company.bs

5.times do
  Stakeholder.create! name: Faker::Name.first_name
end

Project.all.each { |p| p.stakeholders << Stakeholder.all.sample(4) }

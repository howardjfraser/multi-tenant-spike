User.destroy_all
Company.destroy_all

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

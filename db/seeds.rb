# Resets

# NOTE: 1) untenanted classes can be destroy_all'd normally 2) Tenanted should be
# unscoped to destroy_all 3) where an untenanted class has_many with a tenanted class,
# to destroy the untenanted class you need to set Current.company. Even if no tenanted
# instances exist and there is no dependent: :destroy.

Post.unscoped.destroy_all
Project.unscoped.destroy_all

Stakeholder.destroy_all
User.destroy_all

Tenant.all { |c| c.destroy! }

# Creates

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
  # NOTE: both approaches set the company_id correctly
  abc.projects.create! name: Faker::Company.bs
  Project.create! name: Faker::Company.bs

  4.times do
    Post.create({
      user: User.all.sample,
      project: Project.all.sample,
      title: Faker::Lorem.words(number: 2).join(" "),
      body: Faker::Lorem.paragraphs(number: 3)
    })
  end
end

Tenant.switch(xyz) do
  xyz.projects.create! name: Faker::Company.bs
end

# NOTE: legit use of unscoped for admin purposes...
Project.unscoped.each { |p| p.stakeholders << Stakeholder.all.sample(4) }

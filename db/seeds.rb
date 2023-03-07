User.destroy_all
Company.destroy_all

abc = Company.create! name: "ABC Co"
xyz = Company.create! name: "XYZ Co"

abc.users.create! name: "mick"
abc.users.create! name: "keith"

xyz.users.create! name: "john"
xyz.users.create! name: "paul"

billy = User.create! name: "billy"

abc.users << billy
xyz.users << billy

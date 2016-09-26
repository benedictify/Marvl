
ActiveRecord::Base.establish_connection
ActiveRecord::Base.connection.tables.each do |table|
  next if table == 'schema_migrations'
  ActiveRecord::Base.connection.execute("TRUNCATE #{table}")
end

Organisation.create!(name: "Silver Spring UMC")
Organisation.create!(name: "KIPP DC")

Location.create!(name: "Main campus", street_address: "8900 Georgia Ave", city: "Silver Spring", state: "MD", zip_code: "20910", phone: "(301) 587-1215", organisation_id: "1")
Location.create!(name: "KIPP DC AIM Academy: Douglass Campus", street_address: "2600 Douglass Road SE", city: "Washington", state: "DC", zip_code: "20020", phone: "202-678-5477", organisation_id: "2")

coop = User.create!(first_name: "Coop", last_name: "Shop", email: "coop@shop.com", password: "password", organisation_id: 1)
fake = User.create first_name: 'Fake', last_name: 'Member', email: 'fake@person.com', password: 'fakeperson', organisation_id: 1

member = Role.create name: "Member"
admin = Role.create name: "Admin"

coop.add_role(admin.id)
fake.add_role(member.id)

10.times do
  Vendor.create!(name: Faker::Company.name, street_address: "8900 Georgia Ave", city: "Silver Spring", state: "MD", zip_code: "20910", phone: "(301) 555-1215")
end



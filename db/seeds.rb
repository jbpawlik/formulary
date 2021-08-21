# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Medication.destroy_all
MedicationUsers.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!(User.table_name)
ActiveRecord::Base.connection.reset_pk_sequence!(Medication.table_name)
ActiveRecord::Base.connection.reset_pk_sequence!(MedicationUsers.table_name)

i = 0
while i <= 50
  50.times do
    i+=1
    User.create!(email: "#{Faker::Internet.email}", password: "#{Faker::Internet.password}")
    Medication.create!(name: "#{Faker::Verb.base}")
  end
  if i == 50  
    10.times do 
      MedicationUsers.create!(user_id: "#{1..4}",  medication_id: "#{1..4}" )
    end
  end
end

p "Created #{User.count} users and #{Medication.count} medications"
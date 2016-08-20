10.times do
  Doctor.create(name: Faker::Name.name)
end

100.times do
  pesel = Activepesel::Pesel.generate(:one,
          :sex => [1,2].sample,
          :date_of_birth => Faker::Time.between(DateTime.now - 3000, DateTime.now)).number
  Patient.create(name: Faker::Name.name, pesel: pesel)
end

puts "Done!"
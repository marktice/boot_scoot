
# passenger = User.new(email: 'passenger@email.com', password: 'password123') 
# profile = Profile.new(first_name: 'Mark', last_name: 'Tice', sex: 'male', phone_number: '04212224050', home_address: '120 Spencer St, Melbourne')
# car = Car.new(make: 'Subaru', model: 'Imprezza', number_plate: '512324', transmission: 'auto')
# passenger.profile = profile
# passenger.car = car
# passenger.save!

# driver = User.new(email: 'driver@email.com', password: 'password123') 
# profile = Profile.new(first_name: 'Rashid', last_name: 'Ruegen', sex: 'male', phone_number: '04262314050', home_address: '31 Queen St, Melbourne')
# driver_profile = DriverProfile.new(drivers_licence: '3521241123ca', transport_type: 'foldable scooter')
# driver.profile = profile
# driver.driver_profile = driver_profile
# driver.save!

## deletes the file and doesn't work atm, not sure why
# uploader = ImageUploader.new(:store)
# file = File.open(Rails.root.join('public/uploads/seed/scooter.jpg'))
# uploaded_file = uploader.upload(file)

# driver = User.last
# driver.driver_profile.transport_image_data = uploaded_file.to_json
# driver.save!
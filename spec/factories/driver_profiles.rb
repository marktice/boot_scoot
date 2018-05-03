FactoryBot.define do
  factory :driver_profile do
    user nil
    drivers_licence "MyString"
    transport_type "MyString"
    transport_image_data "MyText"
    approved false
    approved_at "2018-05-03 12:02:12"
  end
end

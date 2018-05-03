FactoryBot.define do
  factory :booking do
    passenger nil
    driver nil
    origin_address "MyString"
    destination_address "MyString"
    distance "9.99"
    cost "9.99"
    status "MyString"
    payed_at "2018-05-03 13:58:28"
    completed_at "2018-05-03 13:58:28"
  end
end

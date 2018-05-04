FactoryBot.define do
  factory :review do
    reviewee nil
    reviewer nil
    booking nil
    rating 1
    content "MyText"
  end
end

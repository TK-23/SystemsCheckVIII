FactoryGirl.define do
  factory :review do
    rating 5
    body "Body"
    book
  end
end

FactoryGirl.define do
  factory :review do
    sequence( :rating, 5 ) { |n| rand(n) }
    body "Body"
    book
  end
end

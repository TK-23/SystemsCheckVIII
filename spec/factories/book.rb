FactoryGirl.define do
  factory :book do
    sequence( :title ) { |n| "Title #{n}" }
    sequence( :year, 110 ) { |n| 1900 + rand(n) }
    description "Description"
    author
    category

    factory :book_with_reviews do

      ignore { reviews_count 5 }

      after(:create) do |book, evaluator|
        create_list(:review, evaluator.reviews_count , book: book )
      end
    end
  end
end

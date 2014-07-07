class Review < ActiveRecord::Base
  belongs_to :book

  validates :body, presence: true
  validates :rating, presence: true, inclusion: { :in => 1..5 }
end

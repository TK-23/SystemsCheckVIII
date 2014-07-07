class Review < ActiveRecord::Base
  belongs_to :book

  #validates :rating, presence: true, inclusion: { :in => 1..5 }
end

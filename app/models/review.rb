class Review < ActiveRecord::Base
  belongs_to :book

  validates :body, presence: true
  validates :rating, presence: true, numericality: { greater_than: 0, less_than: 6 }
end

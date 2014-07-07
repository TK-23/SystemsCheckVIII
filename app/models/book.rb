class Book < ActiveRecord::Base
  belongs_to :category
  belongs_to :author
  has_many :reviews

  validates :title, presence: true
  validates :author, presence: true
  validates :year, presence: true
end


class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :book
  validates :review, length: {in: 2..20}
end

class Question < ApplicationRecord

  validates :body, presence: true
  validates :body, length: { maximum: 280 }

end

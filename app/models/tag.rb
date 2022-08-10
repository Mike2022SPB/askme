class Tag < ApplicationRecord

  HASHTAG_REGEX = /#[[:word:]-]+/

  has_and_belongs_to_many :questions, dependent: :destroy
end

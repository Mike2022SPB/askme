class Hashtag < ApplicationRecord
HASHTAG_REGEX = /#[[:word:]-]+/

  has_many :question_hashtags
  has_many :questions, through: :question_hashtags

  def to_param
    name
  end
end

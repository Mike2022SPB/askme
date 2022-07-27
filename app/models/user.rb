class User < ApplicationRecord
  include Gravtastic
  gravtastic(secure: true, filetype: :png, size: 100, default: "robohash")

  has_secure_password

  has_many :questions, dependent: :delete_all
  has_many :authored_questions, class_name: "Question", foreign_key: "author_id", dependent: :nullify

  before_validation :downcase_nickname

  validates :email, presence: true, uniqueness: true, format: { with: /\A\S+@.+\.\S+\z/ }

  validates :nickname, presence: true, uniqueness: true, length: { maximum: 40 }, format: { with: /\A[a-zA-Z0-9_]+\Z/ }

  validates :header_color, format: { with: /\A#\h{3}{1,2}\z/ }

  private

  def downcase_nickname
    nickname&.downcase!
  end
end

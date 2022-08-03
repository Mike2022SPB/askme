class User < ApplicationRecord
  include Gravtastic
  gravtastic(secure: true, filetype: :png, size: 100, default: "robohash")

  has_secure_password

  has_many :questions, dependent: :delete_all
  has_many :authored_questions, class_name: "Question", foreign_key: "author_id", dependent: :nullify

  before_validation :downcase_nickname

  before_validation :downcase_email

  validates :email, presence: true, uniqueness: true, format: { with: /\A\S+@.+\.\S+\z/ }

  validates :nickname, presence: true, uniqueness: true, length: { maximum: 40 }, format: { with: /\A[a-zA-Z0-9_]+\Z/ }

  validates :header_color, format: { with: /\A#[a-f0-9]{6}\z/i }

  def to_param
    email
  end

  private

  def downcase_nickname
    nickname&.downcase!
  end

  def downcase_email
    email&.downcase!
  end
end

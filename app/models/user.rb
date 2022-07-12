class User < ApplicationRecord
  has_secure_password

  before_save :downcase_nickname

  validates :email, presence: true, uniqueness: true
  validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  validates :nickname, presence: true, uniqueness: true
  validates :nickname, length: { maximum: 40 }
  validates :nickname, format: { with: /\A[a-zA-Z0-9_]+\Z/}

  has_many :questions, dependent: :delete_all
  has_many :authored_questions, class_name: "Question", foreign_key: "author_id", dependent: :nullify

  include Gravtastic
  gravtastic(secure: true, filetype: :png, size: 100, default: "robohash")

  def downcase_nickname
    nickname.downcase!
  end
end

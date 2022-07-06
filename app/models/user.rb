class User < ApplicationRecord
  has_secure_password

  before_save :downcase_nickname

  validates :email, presence: true, uniqueness: true
  validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  validates :nickname, presence: true, uniqueness: true
  validates :nickname, length: { maximum: 40 }
  validates :nickname, format: { with: /\A[a-zA-Z0-9_]+\Z/}

  def downcase_nickname
    nickname.downcase!
  end
end

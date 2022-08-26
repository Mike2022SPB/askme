class Question < ApplicationRecord
  belongs_to :user
  belongs_to :author, class_name: "User", optional: true

  has_many :question_hashtags, dependent: :destroy
  has_many :hashtags, through: :question_hashtags

  validates :body, presence: true, length: { maximum: 280 }

  after_save_commit :create_hashtags

  private

  def create_hashtags
    self.hashtags =
      "#{body} #{answer}".downcase.
        scan(Hashtag::HASHTAG_REGEX).
        uniq.
        map { |hashtag| Hashtag.find_or_create_by(name: hashtag.delete('#'))}
  end
end

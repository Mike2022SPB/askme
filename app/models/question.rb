class Question < ApplicationRecord
  belongs_to :user
  belongs_to :author, class_name: "User", optional: true

  has_and_belongs_to_many :tags

  validates :body, presence: true, length: { maximum: 280 }

  after_create do
    question = Question.find_by(id: self.id)
    take_hashtags("#{self.body} #{self.answer}").map do |hashtag|
      tag = Tag.find_or_create_by(name: hashtag.downcase.delete('#'))
      question.tags << tag
    end
  end

  before_update do
    question = Question.find_by(id: self.id)
    question.tags.clear
    take_hashtags("#{self.body} #{self.answer}").map do |hashtag|
      tag = Tag.find_or_create_by(name: hashtag.downcase.delete('#'))
      question.tags << tag
    end
  end

  def take_hashtags(text)
    text.downcase.scan(Tag::HASHTAG_REGEX).uniq
  end
end

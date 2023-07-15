class Post < ApplicationRecord
  validates : title, presence: true
  validates :content, length { minimum: 250}
  validates :summary, length { maximum: 250}
   validates :category, inclusion: { in: ['Fiction', 'Non-Fiction'] }
   validate :sufficiently_clickbait_title

  private

  def sufficiently_clickbait_title
    clickbait_phrases = ["Won't Believe", "Secret", "Top", "Guess"]
    unless clickbait_phrases.include?(title)
      errors.add(:title, 'should be a clickbait phrase')
    end
  end
end

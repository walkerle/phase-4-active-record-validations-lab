class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :clickbait?

  def clickbait?
    refarr = [/Won't Believe/i, /Secret/i, /Top \d/i, /Guess/i]
    if refarr.none? { |t| t.match(title) }
      errors.add(:title, "Clickbait")
    end
  end
end
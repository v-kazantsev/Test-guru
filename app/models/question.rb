class Question < ApplicationRecord
  belongs_to :test
  has_many :answers
  validates_presence_of :body
  validate :answers, if: :in_range

  private

  def in_range
    unless self.answers.size > 0 && self.answers.size < 5
      errors.add(:answers, "Количество ответов должно быть между 1 и 4")
    end
  end

end

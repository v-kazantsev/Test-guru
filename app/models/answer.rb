class Answer < ApplicationRecord
  validates_presence_of :body
  belongs_to :question
  scope :correct, -> { where(correct: true) }
  validate :too_many
  def too_many
    errors.add(:question, 'Too many answers') if self.question.answers.count > 3
  end

end

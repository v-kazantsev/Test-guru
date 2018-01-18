class Question < ApplicationRecord
  belongs_to :test
  has_many :answers
  validates_presence_of :body
  # validate :answers_in_range
  #
  # private
  #
  # def answers_in_range
  #   unless (1..4) === self.answers.size
  #     errors.add(:answers, "Количество ответов должно быть между 1 и 4")
  #   end
  # end

end

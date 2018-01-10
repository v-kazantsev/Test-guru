class Answer < ApplicationRecord
  validates_presence_of :body
  belongs_to :question
  scope :correct, -> { where(correct: true) }
end

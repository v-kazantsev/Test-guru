class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :set_first_question, on: :create

  def completed?
    current_question.nil?
  end

  def result
    (self.correct_answers / self.test.questions.count.to_f) * 100
  end

  def accept!(answer_ids)
    self.correct_answers +=1 if correct_answer?(answer_ids)
    self.update(count: self.count +=1)
    self.current_question = next_question
    save!
  end

  private

  def set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def correct_answer?(answer_ids)
    correct_answers_count = choose_correct_answers.count
    (correct_answers_count == choose_correct_answers.where(id: answer_ids).count) &&
    (correct_answers_count == answer_ids.count if answer_ids)
  end

  def choose_correct_answers
    current_question.answers.correct
  end

  def next_question
    if test.present?
      test.questions.order(:id).where('id > ?', current_question.id).first unless self.completed?
    end
  end

end

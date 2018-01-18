class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create
  before_validation :next_question

  def completed?
    current_question.nil?
  end

  def calc_result
    (self.correct_answers / self.test.questions.count.to_f) * 100
  end

  def accept!(answer_ids)
    self.correct_answers +=1 if correct_answer?(answer_ids)
    self.current_question = next_question
    save!
  end



  private


  def correct_answer?(answer_ids)
    correct_answers_count = choose_correct_answers.count
    (correct_answers_count == choose_correct_answers.where(id: answer_ids).count) &&
    correct_answers_count == answer_ids.count
  end

  def choose_correct_answers
    current_question.answers.correct
  end

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first unless self.completed?
  end

end

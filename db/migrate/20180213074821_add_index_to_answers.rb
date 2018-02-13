class AddIndexToAnswers < ActiveRecord::Migration[5.1]
  def change
    add_index :answers, :question_id
  end
end

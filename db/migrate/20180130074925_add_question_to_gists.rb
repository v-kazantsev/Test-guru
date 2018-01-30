class AddQuestionToGists < ActiveRecord::Migration[5.1]
  def change
    add_reference :gists, :question, foreign_key: true
  end
end

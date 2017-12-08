class ChangeQuestionsBodyType < ActiveRecord::Migration[5.1]
  def change
    change_column(:questions, :body, :text)
  end
end

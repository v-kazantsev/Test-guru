class ChangeAnswersBodyType < ActiveRecord::Migration[5.1]
  def change
    change_column(:answers, :body, :text)
  end
end

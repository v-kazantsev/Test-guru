module QuestionsHelper
  def set_title(question)
    if question.persisted?
      "Edit #{question.test.title} question"
    else
      "Create #{Test.find(params[:test_id]).title} question"
    end
  end
end

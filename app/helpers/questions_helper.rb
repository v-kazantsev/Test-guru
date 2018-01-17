module QuestionsHelper
  def action_header(question)
    if question.persisted?
      "Edit #{question.test.title} question"
    else
      "Create #{Test.find(params[:test_id]).title} question"
    end
  end
end

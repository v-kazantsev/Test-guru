class TestPassagesController < ApplicationController
  before_action :set_test_passage, only: [:show, :update, :result, :gist]

  def show
  end

  def update
    @test_passage.accept!(params[:answer_ids])
    if @test_passage.completed?
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def result
  end

  def gist
    result = GistQuestionService.new(@test_passage.current_question).call
    if result.nil?
      flash[:alert] = t('.failure')
    else
      @test_passage.current_question.gists.create(gist_url: result.id, user: current_user)
      # Gist.create!(
      #             gist_url: result.id,
      #             user_id: current_user.id,
      #             question_id: @test_passage.current_question_id
      #             )
      flash[:info] = "#{view_context.link_to 'Your Gist', result.html_url, target: '_blank' }"
    end
    redirect_to @test_passage
  end

  private
  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end

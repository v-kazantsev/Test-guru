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
    Gist.create!(
                gist_url: result[:files][:'testguru-question.txt'][:raw_url],
                user_id: current_user.id,
                question_id: @test_passage.current_question_id
                )
    flash_options = status == 200 ? { notice: t('.success') } : { alert: t('.failure') }
    flash[:info] = "#{view_context.link_to 'Your Gist', result[:files][:'testguru-question.txt'][:raw_url]}"
    redirect_to @test_passage, flash_options
  end

  private
  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end

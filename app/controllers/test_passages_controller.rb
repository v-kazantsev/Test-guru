class TestPassagesController < ApplicationController
  before_action :set_test_passage, only: [:show, :update, :result, :gist, :end_by_timeout]

  def end_by_timeout
    TestsMailer.completed_test(@test_passage).deliver_now
    redirect_to result_test_passage_path(@test_passage)
  end

  def show
  end

  def update
    @test_passage.accept!(params[:answer_ids])
      if @test_passage.completed?
        TestsMailer.completed_test(@test_passage).deliver_now
        redirect_to result_test_passage_path(@test_passage)
      else
        render :show
    end
  end

  def result
    current_user.update(tests_passed: current_user.tests_passed += 1) if @test_passage.result > 85
    Awards.new(@test_passage).call if @test_passage.result > 85
  end

  def gist
    result = GistQuestionService.new(@test_passage.current_question).call
    if result.nil?
      flash[:alert] = t('.failure')
    else
      @test_passage.current_question.gists.create(gist_url: result.url, user: current_user)
      flash[:info] = "#{view_context.link_to 'Your Gist', result.html_url, target: '_blank' }"
    end
    redirect_to @test_passage
  end

  private
  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end

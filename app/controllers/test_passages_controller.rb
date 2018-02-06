class TestPassagesController < ApplicationController
  before_action :set_test_passage, only: [:show, :update, :result, :gist]

  def show
  end

  def update
    @test_passage.accept!(params[:answer_ids])
    respond_to do |format|
      if @test_passage.completed?
        format.html { redirect_to result_test_passage_path(@test_passage) }
      else
        format.html { render :show }
        format.js {}
      end
    end
  end

  def result
  end

  def gist
    result = GistQuestionService.new(@test_passage.current_question).call
    byebug
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

class TestPassagesController < ApplicationController
  before_action :set_test_passage, only: [:show, :update, :result, :gist, :end_by_timeout]
  before_action :timer, only: [:show]

  def timer
    session[:timer] = nil
    if @test_passage.test.countdown > 0
      @timer ||= Thread.new do
        time = 0
        seconds = @test_passage.test.countdown
        while time < seconds
          session[:timer] = seconds - time
          if session[:timer] <= 1
            redirect_to result_test_passage_path(@test_passage)
          end
          sleep(1)
          time += 1
          render 'timer'
        end
      end
    end
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
    @timer.kill if @timer
    session[:timer] = nil
    if @test_passage.result > 85
      current_user.update(tests_passed: current_user.tests_passed += 1)
      Awards.new(@test_passage).call
    end
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

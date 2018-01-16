class QuestionsController < ApplicationController
  before_action :set_question, only: [:destroy, :edit, :update]
  before_action :set_test, only: [:create, :new]

  def new

    @question = Question.new
  end
# Модуль 7 Задание 2 Вопрос 3
  def create

    @question = @test.questions.new(question_params)
    if @question.save
      redirect_to @test, notice: "Вопрос создан"
    else
      render :new, alert: "Что-то не так"
    end
  end
#
# Модуль 7 Задание 2 Вопрос 4
  def destroy
    @question.destroy
    redirect_to @question.test, notice: "Вопрос удален"
  end
#
  def edit
  end

  def update
    if @question.update(question_params)
      redirect_to @question.test, notice: "Вопрос отредактирован"
    else
      render :edit, alert: "Что-то не так"
    end
  end

  private
  def set_question
    @question = Question.find(params[:id])
  end

  def set_test
    @test = Test.find(params[:test_id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

end

class QuestionsController < ApplicationController
  before_action :set_test, only: [:index, :create]
  before_action :set_question, only: [:destroy, :edit, :update]
# Модуль 7 Задание 3

#

# Модуль 7 Задание 2 Вопрос 1,5
  def index
    render plain: "Вопросы к тесту №#{params[:test_id]}"
    @questions = @test.questions.all.pluck(:body)
  end
#
# Модуль 7 Задание 2 Вопрос 2,5
  def show
    @test = Test.find(1)
    @question = @test.questions.find(params[:id])
    render html: "<h2>#{@question.body}</h2>".html_safe
  end
#
# Модуль 7 Задание 2 Вопрос 3
  def create
    @question = @test.questions.new(question_params)
    if @question.save
      redirect_to @test, notice: "Вопрос создан"
    else
      redirect_to @test, alert: "Что-то не так"
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
# Модуль 7 Задание 2 Вопрос 6
  def set_test
    @test = Test.find(params[:test_id])
  end
#
  def question_params
    params.require(:question).permit(:body)
  end

end

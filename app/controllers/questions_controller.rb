class QuestionsController < ApplicationController
  before_action :set_test, only: [:create, :destroy]
# Модуль 7 Задание 3
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found


# Модуль 7 Задание 2 Вопрос 1,5
  def index
#    @questions = Question.all
    render plain: "Вопросы к тесту №#{params[:test_id]}"
  end
#
# Модуль 7 Задание 2 Вопрос 2,5
  def show
#    @question = Question.find(params[:id])
    render html: "<h2>Вопрос №#{params[:id]}</h2>".html_safe
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
    @cquestion = @test.questions.find(params[:id])
    @question.destroy
    redirect_to @test, notice: "Вопрос удален"
  end
#

  private
# Модуль 7 Задание 2 Вопрос 6
  def set_test
    @test = Test.find(params[:test_id])
  end
#
  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: 'Вопрос не найден'
  end


end

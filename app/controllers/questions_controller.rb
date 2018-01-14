class QuestionsController < ApplicationController
  before_action :set_test, only: [:index, :create]
# Модуль 7 Задание 3

#

# Модуль 7 Задание 2 Вопрос 1,5
  def index
  #  render plain: "Вопросы к тесту №#{params[:test_id]}"
    @questions = @test.questions.all
    buffer = []
    @questions.each do |q|
     buffer << q.body
    end
    render plain: buffer
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
    @test = Test.find(1)
    @question = @test.questions.find(params[:id])
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

end

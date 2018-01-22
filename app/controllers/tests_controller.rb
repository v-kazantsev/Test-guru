class TestsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test, only: [:show, :edit, :update, :destroy, :start]


def index
  @tests = Test.all
end

def new
  @test = Test.new
end

def create
  @test = Test.new(test_params)
  if @test.save
    redirect_to tests_path, notice: "Тест успешно создан"
  else
    render :new, alert: "Что-то не так"
  end
end

def show
end

def edit
end

def update
  if @test.update(test_params)
    redirect_to @test, notice: "Тест успешно отредактирован"
  else
    render :edit, alert: "Что-то не так"
  end
end

def destroy
  @test.destroy
  redirect_to tests_path, notice: "Тест удален"
end

def start
  @user = current_user
  @user.tests.push(@test)
  redirect_to @user.test_passage(@test)
end


private
def test_params
  params.require(:test).permit(:title, :level, :category_id)
end

def set_test
  @test = Test.find(params[:id])
end

end

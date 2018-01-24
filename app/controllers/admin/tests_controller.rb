class Admin::TestsController < Admin::BaseController

  before_action :set_test, only: [:show, :edit, :update, :destroy]


def index
  @tests = Test.all
end

def new
  @test = Test.new
end

def create
  @test = Test.new(test_params)
  if @test.save
    @test.author = current_user
    redirect_to admin_tests_path, notice: "Тест успешно создан"
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
    redirect_to admin_tests_path, notice: "Тест успешно отредактирован"
  else
    render :edit, alert: "Что-то не так"
  end
end

def destroy
  @test.destroy
  redirect_to admin_tests_path, notice: "Тест удален"
end

private
def test_params
  params.require(:test).permit(:title, :level, :category_id)
end

def set_test
  @test = Test.find(params[:id])
end

end

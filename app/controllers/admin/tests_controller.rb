class Admin::TestsController < Admin::BaseController

  before_action :set_test, only: [:show, :edit, :update, :destroy]


def index
  @tests = Test.all
end

def new
  @test = Test.new
end

def create
  @test = current_user.created_tests.new(test_params)
  if @test.save
    redirect_to admin_tests_path, notice: t('.success')
  else
    render :new, alert: t('fail')
  end
end

def show
end

def edit
end

def update
  if @test.update(test_params)
    redirect_to admin_tests_path, notice: t('.success')
  else
    render :edit, alert: t('fail')
  end
end

def destroy
  @test.destroy
  redirect_to admin_tests_path, notice: t('success')
end

private
def test_params
  params.require(:test).permit(:title, :level, :category_id)
end

def set_test
  @test = Test.find(params[:id])
end

end

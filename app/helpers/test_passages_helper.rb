module TestPassagesHelper
  def show_result(test_passage)
    if test_passage.calc_result < 85.0
      'Вы не прошли тест'
    else
      'Вы упешно прошли тест'
    end
  end
  def set_color(test_passage)
    if test_passage.calc_result < 85.0
      'not_passed'
    else
      'passed'
    end
  end
end

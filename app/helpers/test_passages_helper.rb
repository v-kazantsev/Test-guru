module TestPassagesHelper
  def test_passage_result(test_passage)
    if test_passage.result < 85.0
      color = 'red'
    else
      color = 'green'
    end
    tag.span class: color do
    number_to_percentage(test_passage.result, precision: 0)
    end
  end
end

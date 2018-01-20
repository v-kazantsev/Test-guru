module TestPassagesHelper
  def test_passage_result_amount(test_passage)
    color = test_passage.result < 85.0 ? 'red' : 'green'
    tag.span class: color do
    number_to_percentage(test_passage.result, precision: 0)
    end
  end
end

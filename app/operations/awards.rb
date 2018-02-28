class Awards
  def initialize(test_passage)
    @test_passage = test_passage
  end

  def call
    Badge.all.each do |badge|
      case badge.rule
      when 'passed_times'
        award!(badge) if badge.passed_times_rule?(@test_passage, badge.rule_value)
      when 'category'
        award!(badge) if badge.passed_category_rule?(@test_passage, badge.rule_value)
      end
    end
  end
  private
  def award!(badge)
    @test_passage.user.badges << badge
  end
end

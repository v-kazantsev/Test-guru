class Awards
  def initialize(test_passage)
    @test_passage = test_passage
  end

  def call
    Badge.all do |badge|
      byebug
      case badge.rule
      when 'passed_times'
        award!(badge) if badge.passed_times_rule?(badge.rule_value)
      when 'category'
        award!(badge) if badge.passed_category_rule?(badge.rule_value)
      end
    end
  end
  private
  def award!(badge)
    current_user.badges << badge
    save!
  end
end

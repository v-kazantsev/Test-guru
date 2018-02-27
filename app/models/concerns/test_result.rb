module TestResult
  extend ActiveSupport::Concern
  included do
    def calculate_tests_passed
      current_user.update(tests_passed: current_user.tests_passed += 1) if @test_passage.result > 85
    end
  end
end

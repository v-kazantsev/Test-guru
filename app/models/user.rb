class User < ApplicationRecord
  has_and_belongs_to_many :tests

  def get_test_by_level(level)
    User.joins(:tests).where(tests: { level: level })
  end
end

class User < ApplicationRecord
  has_and_belongs_to_many :tests
  has_many :tests

  def get_test_by_level(level)
    self.tests.where(level: level)
  end
end

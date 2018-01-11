class User < ApplicationRecord
  has_and_belongs_to_many :tests
  has_many :tests
  validates_presence_of :email

  def get_tests_by_level(level)
    self.tests.where(level: level)
  end
end

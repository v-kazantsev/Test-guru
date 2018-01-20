class User < ApplicationRecord
  validates_presence_of :email
  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :created_tests, class_name: 'Test', foreign_key: :user_id

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

end

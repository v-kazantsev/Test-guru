class User < ApplicationRecord

  validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates_presence_of :password, if: Proc.new { |u| u.password_digest.blank? }
  validates_confirmation_of :password
  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :created_tests, class_name: 'Test', foreign_key: :user_id
  has_secure_password

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

  #validates_presence_of :password, if: Proc.new { |u| u.password_digest.blank? }
  #validates_confirmation_of :password
  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :achievements
  has_many :badges, through: :achievements
  has_many :created_tests, class_name: 'Test', foreign_key: :user_id
  has_many :gists

  def first_name
    unless self.name.blank?
      self.name.split.first
    else
      'Guru'
    end
  end


  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

end

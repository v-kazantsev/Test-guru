class Test < ApplicationRecord
  has_many :test_passages
  has_many :users, through: :test_passages
  has_many :questions, dependent: :destroy
  belongs_to :category, optional: true
  belongs_to :author, class_name: 'User', foreign_key: :user_id, optional: true
  validates_presence_of :title
  validates :level, numericality: { only_integer: true, greather_than_or_equal_to: 0 }
  validates :title, uniqueness: { scope: :level }
  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  scope :by_category, -> (category) { where(category_id: Category.joins(:tests).where(title: category)) }
end

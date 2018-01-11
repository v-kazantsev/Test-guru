class Test < ApplicationRecord
  has_and_belongs_to_many :users
  belongs_to :category
  has_many :questions
  belongs_to :author, class_name: 'User', foreign_key: :user_id
  validates_presence_of :title
  validates :level, numericality: { only_integer: true, greather_than_or_equal_to: 0 }
  validates :title, uniqueness: { scope: :level }

  # def self.test_by_category(category)
  #   Test.order_by_title.where(category_id: Category.id_by_name(category)).pluck(:title).uniq
  # end

  scope :order_by_title, -> { order title: :desc }
  scope :simple, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  scope :by_category, -> (category) { where(category_id: Category.joins(:tests).where(title: category)).order(title: :desc).pluck(:title) }
end

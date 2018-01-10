class Test < ApplicationRecord
  has_and_belongs_to_many :users
  belongs_to :category
  has_many :questions
  belongs_to :user

  def self.test_by_category(category)
    Test.order_by_title.where(category_id: Category.id_by_name(category)).pluck(:title).uniq
  end

  scope :order_by_title, -> { order title: :desc }
end

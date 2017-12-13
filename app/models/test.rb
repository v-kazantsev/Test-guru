class Test < ApplicationRecord
  def self.test_by_category(category)
    Test.order(
      title: :desc).where(category_id: Category.select(:id).find_by(
      title: category)).pluck(:title
      )
  end
end

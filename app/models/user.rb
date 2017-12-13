class User < ApplicationRecord
  def get_test_by_level(level)
    test_ids = []
    test_ids = User.where("tests_users.user_id": :id).pluck("tests_users.test_id")
    test_ids.map do |ids|
      Test.select(:title).find_by(id: ids)
    end
  end
end

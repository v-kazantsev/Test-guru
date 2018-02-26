class Badge < ApplicationRecord
  has_many :achievements
  has_many :users, through: :achievements
  include Placeholder
  validates_presence_of :name
  after_initialize :set_default_image

  def set_default_image
    self.main_img ||= Placeholder.image_generator(width: 300, height: 300)
  end

  def passed_times_rule?(rule_value)
    current_user.tests_passed == rule_value
  end

end

class Category < ApplicationRecord
  has_many :tests
  validates_presence_of :title
  default_scope { order title: :asc }

  def translated_name
    I18n.t(title, scope: 'category')
  end

end

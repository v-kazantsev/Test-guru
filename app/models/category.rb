class Category < ApplicationRecord
  has_many :tests
  validates_presence_of :title
  default_scope { order title: :asc }
  scope :id_by_name, -> (name) { where(title: name).ids }
end

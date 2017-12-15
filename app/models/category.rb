class Category < ApplicationRecord
  scope :id_by_name, -> (category_name){ select(:id).where(title: category_name) }
end

class Category < ApplicationRecord
  scope :id_by_name, -> (category_name){ select(:id).find_by!(title: category_name) }
end

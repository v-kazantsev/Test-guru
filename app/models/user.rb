class User < ApplicationRecord
  has_and_belongs_to_many :tests
  has_many :tests
  validates_presence_of :email
  
end

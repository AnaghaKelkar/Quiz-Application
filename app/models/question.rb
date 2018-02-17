class Question < ApplicationRecord
  has_many :choices
  has_one :category
end

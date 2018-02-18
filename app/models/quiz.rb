class Quiz < ApplicationRecord
  has_many :user_inputs
  belongs_to :category
end

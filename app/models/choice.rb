class Choice < ApplicationRecord
  belongs_to :question
  has_many :user_inputs
end

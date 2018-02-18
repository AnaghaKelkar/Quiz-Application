class UserInput < ApplicationRecord
  belongs_to :user
  belongs_to :choice
  belongs_to :question 
  belongs_to :quiz

  scope :correct_answers, -> { where(correct_answer: true) }
  scope :incorrect_answers, -> { where(correct_answer: false) }
end

class Question < ApplicationRecord
  has_many :choices
  belongs_to :category
  has_many :user_inputs

  def next_question(question_ids)
  	next_index =  question_ids.index(id) + 1
    next_question_id = question_ids.at(next_index)
    next_question_id.present? ? Question.find(next_question_id) : nil
  end
end

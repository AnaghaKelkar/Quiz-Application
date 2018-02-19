class Quiz < ApplicationRecord
  has_many :user_inputs
  belongs_to :category

  def self.filter(params,user)
  	question_ids = split_question_ids(params[:quelist])
    next_question = Question.find(params[:question_id]).next_question(question_ids)
    quiz = Quiz.find_by_id(params[:quiz])
    entry = user.create_quiz_entry(params[:choice], question_ids, quiz)
    score = next_question.nil? ? entry : nil
    [question_ids, next_question, quiz, score]
  end

  def self.split_question_ids(list)
  	list.split().map(&:to_i)
  end
end

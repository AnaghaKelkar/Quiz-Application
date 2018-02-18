class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :user_inputs

  def create_quiz_entry(choice_id, questions, quiz)
    choice = Choice.find(choice_id)
    UserInput.create!(user: self, choice: Choice.find(choice_id),
                        question: choice.question, correct_answer: choice.correct, quiz: quiz)
    return user_inputs.where(question: questions, correct_answer: true, quiz: quiz).count
  end
end

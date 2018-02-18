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

  def calculate_progress
    return ["positive-review", "You are yet to take quiz. All the best!"] if user_inputs.count.zero?
    percentage = (user_inputs.correct_answers.count*100)/(user_inputs.count)
    return ["positive-review", "You are doing great! Go ahead !"] if percentage >= 60
    return ["negative-review", "You need more practice. Practice hard."] if percentage < 60
  end
end

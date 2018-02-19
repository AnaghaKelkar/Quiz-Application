class JsonBuilder
  attr_reader :user
  def initialize(user)
    @user = user
  end

  def build
    user_json = {}
    user_json["total_questions"] = Question.count
    user_json["questions_answered"] = entries.count
    user_json["correct_answers"] = entries.correct_answers.count
    user_json["incorrect_answers"] = entries.incorrect_answers.count
    user_json["questions_remaining"] = user_json["total_questions"] - user_json["questions_answered"]
    return user_json
  end

  def entries
    user.user_inputs
  end
end

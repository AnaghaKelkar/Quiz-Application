class QuizController < ApplicationController
  def index
    @quiz = Quiz.find(current_user.user_inputs.pluck(:quiz_id))
  end

  def review
    @quiz = Quiz.find(params[:quiz_id])
    @user_inputs = @quiz.user_inputs
    @count = 5 # in this case its 5 always otherwise will need to retrieve it from database
  end

  def summary
    @categories = Category.all
  end

  def question
    @category = category(params)
    if params[:question_id].present?
      @question_ids, @next_question, @quiz, @score = Quiz.filter(params, current_user)
    else
      @question_ids = question_ids_for_quiz(params)
      if @question_ids.empty?
        @message = "No more questions left"
      else
        @next_question = Question.find(@question_ids.first)
        @quiz = quiz
      end
    end
    @choices = @next_question.choices if @next_question.present?
  end

private
  def category(params)
    @category ||= Category.find_by_name(params[:category])
  end

  def question_ids_for_quiz(params)
    return category(params).nil? ? ids(Question.all) : ids(category(params).questions)
  end

  def ids(questions)
    return questions.where.not(id: current_user.user_inputs.pluck(:question_id)).sample(5).pluck(:id)
  end

  def quiz
    last_quiz_id = Quiz.last.try(:id).nil? ? 1 : Quiz.last.try(:id)+1
    lbl = "Quiz #{last_quiz_id}"
    quiz = Quiz.new(name: lbl, category: @category)
    quiz.save(validate: false)
    return quiz
  end
end

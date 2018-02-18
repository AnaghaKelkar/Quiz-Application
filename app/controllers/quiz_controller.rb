class QuizController < ApplicationController
  def index
    @quiz = Quiz.find(current_user.user_inputs.pluck(:quiz_id))
  end

  def review
    @quiz = Quiz.find(params[:quiz_id])
    @user_inputs = @quiz.user_inputs
    @count = @user_inputs.first.question.choices.count
  end

  def summary
    @categories = Category.all
  end

  def question
    @category = category(params)
    if params[:question_id].present?
      @quelist, @question, @quiz, score = filter_parameters(params)
      @quiz_score = score unless @question.present?
    else
      @quelist = generate_random_questions(params)
      if @quelist.empty?
        @message = "No more questions left"
      else
        @question = Question.find(@quelist.first)
        @quiz = Quiz.new(name: "Quiz", category: @category)
        @quiz.save(validate: false)
      end
    end
    @choices = @question.choices if @question.present?
  end

  def category(params)
    @category ||= Category.find_by_name(params[:category])
  end

  def filter_parameters(params)
    questions_for_quiz = params[:quelist].split().map(&:to_i)
    question = questions_for_category.find(params[:question_id]).next_question(questions_for_quiz)
    quiz_entry = Quiz.where(id: params[:quiz]).first
    score = current_user.create_quiz_entry(params[:choice], questions_for_quiz, quiz_entry)
    [questions_for_quiz, question, quiz_entry, score]
  end

  def generate_random_questions(params)
    if category(params).nil?
      questions_for_category.where.not(id: current_user.user_inputs.pluck(:question_id)).sample(5).pluck(:id)
    else
      questions_for_category.where.not(id: current_user.user_inputs.pluck(:question_id)).sample(5).pluck(:id)
    end
  end

  def questions_for_category
    if category(params).nil?
      Question.all
    else
      category(params).questions
    end
  end
end

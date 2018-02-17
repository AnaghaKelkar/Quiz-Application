require 'csv'
class SetupChoice
  def initialize(csv)
    @csv = csv
  end

  def call
    @csv.each do |entry|
      correct = entry["correct"]
      save_choice(entry, "answer1", correct)
      save_choice(entry, "answer2", correct)
      save_choice(entry, "answer3", correct)
      save_choice(entry, "answer4", correct)
      save_choice(entry, "answer5", correct)
    end
  end

  def save_choice(entry, ans, correct)
    ch = Choice.new(text: entry[ans], correct: false)
    ch.question = Question.find_by_unique_id(entry["question_id"])
    ch.correct = true if correct == ans
    ch.save!
  end
end
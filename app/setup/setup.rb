require 'csv'
class Setup
  def self.call
  	path = "#{Rails.root}/db/question.csv"
  	csv = CSV.open(path, :headers => true).to_a
    SetupCategory.call
    SetupQuestion.new(csv).call
    SetupChoice.new(csv).call
  end
end
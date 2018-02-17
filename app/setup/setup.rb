class Setup
  def self.call
    Category.call
    Question.call
    Choice.call
  end
end
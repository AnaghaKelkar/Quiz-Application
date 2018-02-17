class SetupQuestion
	def initialize(csv)
		@csv = csv
	end

  def call
  	@csv.each do |entry|
      que = Question.new(unique_id: entry['question_id'], text: entry['question'])
      que.category = Category.find_by_name(entry["Category"])
      que.save!
    end
  end
end
class AddCategoryToQuiz < ActiveRecord::Migration[5.1]
  def up
  	add_column :quizzes, :category_id, :integer
  end

  def down
  	drop_column :quizzes, :category_id
  end
end

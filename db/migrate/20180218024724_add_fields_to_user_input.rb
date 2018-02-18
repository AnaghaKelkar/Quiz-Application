class AddFieldsToUserInput < ActiveRecord::Migration[5.1]
  def up
  	add_column :user_inputs, :question_id, :integer
  	add_column :user_inputs, :correct_answer, :boolean
  end

  def down
  	drop_column :user_inputs, :question_id
  	drop_column :user_inputs, :correct_answer
  end
end

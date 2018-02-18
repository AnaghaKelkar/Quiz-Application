class AddQuizToUserInput < ActiveRecord::Migration[5.1]
  def up
    add_column :user_inputs, :quiz_id, :integer
  end

  def down
    drop_column :user_inputs, :quiz_id
  end
end

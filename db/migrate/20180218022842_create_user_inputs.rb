class CreateUserInputs < ActiveRecord::Migration[5.1]
  def change
    create_table :user_inputs do |t|
    	t.integer :user_id
    	t.integer :choice_id
      t.timestamps
    end
  end
end

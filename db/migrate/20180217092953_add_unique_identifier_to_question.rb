class AddUniqueIdentifierToQuestion < ActiveRecord::Migration[5.1]
  def up
    add_column :questions, :unique_id, :integer
  end

  def down
    add_column :questions, :unique_id
  end
end

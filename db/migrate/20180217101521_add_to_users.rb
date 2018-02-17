class AddToUsers < ActiveRecord::Migration[5.1]
  def up
    add_column :users, :name, :string
  end

  def down
    drop_column :users, :name
  end
end

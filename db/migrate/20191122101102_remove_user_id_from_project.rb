class RemoveUserIdFromProject < ActiveRecord::Migration[5.2]
  def change
    remove_reference :projects, :user, index: true, foreign_key: true
    add_column :teams, :role, :string
    add_column :teams, :name, :string
  end
end

class AddSignedInAsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :signed_in_as, :string
  end
end

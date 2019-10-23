class CreateScripts < ActiveRecord::Migration[5.2]
  def change
    create_table :scripts do |t|
      t.string :name
      t.text :text
      t.references :section, foreign_key: true

      t.timestamps
    end
  end
end

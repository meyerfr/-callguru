class CreateCalls < ActiveRecord::Migration[5.2]
  def change
    create_table :calls do |t|
      t.string :title
      t.string :customer_name
      t.text :notes
      t.integer :last_section
      t.references :team, foreign_key: true

      t.timestamps
    end
  end
end

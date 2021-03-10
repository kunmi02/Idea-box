class CreateIdeas < ActiveRecord::Migration[6.1]
  def change
    create_table :ideas do |t|
      t.integer :author_id
      t.string :text

      t.timestamps
    end
    add_index :ideas, :author_id
  end
end

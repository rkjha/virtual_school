class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.text :desc

      t.timestamps
    end
    add_index :questions, [:user_id, :created_at]
  end
end

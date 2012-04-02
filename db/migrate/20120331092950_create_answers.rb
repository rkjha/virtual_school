class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :ans

      t.timestamps
    end
  end
end

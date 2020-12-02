class CreateUgQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :ug_questions do |t|
      t.string :title
      t.string :correct

      t.timestamps
    end
  end
end

class CreateFeedbacks < ActiveRecord::Migration[7.1]
  def change
    create_table :feedbacks do |t|
      t.string :comment
      t.string :created_by
      t.references :cloth, null: false, foreign_key: true

      t.timestamps
    end
  end
end

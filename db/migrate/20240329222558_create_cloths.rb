class CreateCloths < ActiveRecord::Migration[7.1]
  def change
    create_table :cloths do |t|
      t.string :name
      t.string :description
      t.decimal :cost
      t.references :location, null: false, foreign_key: true

      t.timestamps
    end
  end
end

class CreateLocations < ActiveRecord::Migration[7.1]
  def change
    create_table :locations do |t|
      t.string :area
      t.string :city
      t.string :province

      t.timestamps
    end
  end
end

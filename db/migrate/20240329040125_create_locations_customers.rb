class CreateLocationsCustomers < ActiveRecord::Migration[7.1]
  def change
    create_table :locations_customers, id: false do |t|
      t.references :customer, null: false, foreign_key: true
      t.references :location, null: false, foreign_key: true

      t.timestamps
    end
  end
end

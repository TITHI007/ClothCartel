class AddClothimage < ActiveRecord::Migration[7.1]
  def change
    add_column :cloths, :image, :text
  end
end

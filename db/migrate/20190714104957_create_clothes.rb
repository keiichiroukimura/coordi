class CreateClothes < ActiveRecord::Migration[5.2]
  def change
    create_table :clothes do |t|
      t.text :image_first
      t.text :image_second
      t.text :image_third
      t.integer :gender
      t.integer :height
      t.text :content

      t.timestamps
    end
  end
end

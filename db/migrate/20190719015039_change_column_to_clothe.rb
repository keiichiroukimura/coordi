class ChangeColumnToClothe < ActiveRecord::Migration[5.2]
  def change
    change_column :clothes, :image_first, :text, null: false
  end
end

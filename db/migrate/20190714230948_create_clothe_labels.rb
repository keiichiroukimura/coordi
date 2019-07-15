class CreateClotheLabels < ActiveRecord::Migration[5.2]
  def change
    create_table :clothe_labels do |t|
      t.text :content
      t.references :clothe, foreign_key: true
      t.references :label, foreign_key: true

      t.timestamps
    end
  end
end

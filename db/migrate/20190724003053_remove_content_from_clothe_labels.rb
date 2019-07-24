class RemoveContentFromClotheLabels < ActiveRecord::Migration[5.2]
  def change
    remove_column :clothe_labels, :content, :text
  end
end

class RemoveColumnsFromSavedNews < ActiveRecord::Migration[7.1]
  def change
    remove_column :saved_news, :description, :text
    remove_column :saved_news, :source, :string
  end
end

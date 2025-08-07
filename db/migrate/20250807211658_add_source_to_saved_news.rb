class AddSourceToSavedNews < ActiveRecord::Migration[7.1]
  def change
    add_column :saved_news, :source, :string
  end
end

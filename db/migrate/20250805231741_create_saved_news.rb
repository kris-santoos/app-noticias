class CreateSavedNews < ActiveRecord::Migration[7.1]
  def change
    create_table :saved_news do |t|
      t.string :title
      t.text :description
      t.string :url

      t.timestamps
    end
  end
end

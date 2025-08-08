class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :link
      t.text :description
      t.references :user, null: false, foreign_key: true
      t.string :source

      t.timestamps
    end
  end
end

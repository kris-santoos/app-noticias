class CreateArticles < ActiveRecord::Migration[7.1]
  def change
    create_table :articles do |t|
      t.string :title, null: false, default: ''
      t.string :link, null: false, default: ''
      t.text :description, null: false, default: ''
      t.references :user, null: true, foreign_key: true

      t.timestamps
    end
  end
end

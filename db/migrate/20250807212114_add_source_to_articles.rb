class AddSourceToArticles < ActiveRecord::Migration[7.1]
  def change
    add_column :articles, :source, :string
  end
end

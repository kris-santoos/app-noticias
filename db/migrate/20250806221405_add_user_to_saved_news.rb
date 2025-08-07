class AddUserToSavedNews < ActiveRecord::Migration[7.1]
  def change
    add_reference :saved_news, :user, foreign_key: true
  end
end

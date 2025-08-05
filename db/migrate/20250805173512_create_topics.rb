class CreateTopics < ActiveRecord::Migration[7.1]
  def change
    create_table :topics do |t|
      t.string :name, null: false, default: ''

      t.timestamps
    end
  end
end

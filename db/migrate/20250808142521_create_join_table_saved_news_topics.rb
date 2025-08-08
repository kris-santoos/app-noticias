class CreateJoinTableSavedNewsTopics < ActiveRecord::Migration[7.1]
  def change
    create_join_table :saved_news, :topics do |t|
      # t.index [:saved_news_id, :topic_id]
      # t.index [:topic_id, :saved_news_id]
    end
  end
end

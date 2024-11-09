class CreateJoinTableArticleDescription < ActiveRecord::Migration[7.2]
  def change
    create_join_table :articles, :descriptions do |t|
      # t.index [:article_id, :description_id]
      # t.index [:description_id, :article_id]
    end
  end
end

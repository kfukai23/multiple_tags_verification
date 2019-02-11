class AddIndexToArticleCategory < ActiveRecord::Migration[5.2]
  def change
    add_index :article_categories, :article_id
    add_index :article_categories, :category_id
    add_index :article_categories, [:article_id,:category_id],unique: true
  end
end

class ArticleCategory < ApplicationRecord
  belongs_to :article
  belongs_to :category
  validates :article_id,presence:true
  validates :category_id,presence:true
  before_destroy :check_free_tag

  def check_free_tag
    self.category.destroy if self.category.article_categories.count == 1
  end


end

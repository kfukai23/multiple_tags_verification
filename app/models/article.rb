class Article < ApplicationRecord
  # around_destroy :check_free_tags
  has_many :article_categories, dependent: :destroy
  has_many :categories, through: :article_categories
  accepts_nested_attributes_for :article_categories

  def save_categories(tags, current_user)
    tags.uniq!
    current_tags = self.categories.pluck(:name) unless self.categories.nil?
    old_tags = current_tags - tags
    new_tags = tags - current_tags

    # Destroy old taggings:
    old_tags.each do |old_name|
      self.categories.delete current_user.categories.find_by(name:old_name)
      current_user.categories.find_by(name:old_name).delete if current_user.categories.find_by(name:old_name).article_categories.blank?
    end

    # Create new taggings:
    new_tags.each do |new_name|
      article_category = current_user.categories.find_or_create_by(name:new_name)
      self.categories << article_category
    end
  end
end

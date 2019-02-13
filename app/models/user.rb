class User < ApplicationRecord
  has_secure_password
  has_many :articles, dependent: :destroy
  has_many :categories, dependent: :destroy
end
